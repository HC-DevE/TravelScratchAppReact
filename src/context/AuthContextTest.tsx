import AsyncStorage from '@react-native-async-storage/async-storage';
import axios from 'axios';
import React, { createContext, useEffect, useState } from 'react';
import { API_URL } from '../config/config';
import { LoginFormData } from '../models/Login.model';
import Joi from 'joi';

export const AuthContext = createContext(
    {
        onLogin: ({ email, password }: LoginFormData) => { },
        onLogout: () => { },
        isLoading: true,
        userToken: null,
        isAuthenticated: false,
    }
);

export const AuthProvider = ({ children }: any) => {
    const [isLoading, setIsLoading] = useState(false);
    const [userToken, setUserToken] = useState(null);
    const [isAuthenticated, setAuthenticated] = useState(false);


    const onLogin = async ({ email, password }: LoginFormData) => {

        setIsLoading(true);
        
        // const loginSchema = Joi.object({
        //     email: Joi.string().trim().email().max(100).required(),
        //     password: Joi.string().min(8).max(255).required(),
        // });

        // const { error, value } = loginSchema.validate({ email, password });
        // if (error) {
        //     console.log(error);
        //     console.log(value);
        //     return;
        // }

        try {
            const response = await axios.post(`${API_URL}auth/login`, {
                email: email,
                password_hash: password,
            });

            // Save the token from the response to a variable that we will use later
            const token = response.data.token;

            // Save the token to AsyncStorage
            await AsyncStorage.setItem('userToken', token);

            // Save the token to the axios default headers
            axios.defaults.headers.common['Authorization'] = response.data.token;
            setUserToken(token);
            setIsLoading(false);
            setAuthenticated(true);
        } catch (error: any) {
            if (error.response) {
                console.log('Error during login:', error.response.data);
            } else {
                console.log('Error during login:', error.message);
            }
        }

    };

    const onLogout = () => {
        setIsLoading(true);
        setUserToken(null);
        delete axios.defaults.headers.common['Authorization'];
        AsyncStorage.removeItem('userToken');
        setIsLoading(false);
        setAuthenticated(false);
    };

    const isLoggedIn = async () => {
        let userToken = await AsyncStorage.getItem('userToken');
        setUserToken(userToken);
        setIsLoading(false);
        return userToken !== null ? true : false;
    }

    useEffect(() => {
        isLoggedIn().then((res) => {
            setAuthenticated(res);
        })
    })

    const authContext = {
        onLogin,
        onLogout,
        isLoading,
        userToken,
        isAuthenticated
    };

    return (
        <AuthContext.Provider value={authContext}>
            {children}
        </AuthContext.Provider>
    );
};
