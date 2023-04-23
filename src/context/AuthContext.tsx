import { createContext, useContext, useEffect, useState } from 'react';
import axios from 'axios';
import { RegisterFormData } from '../models/Register.model';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { LoginFormData } from '../models/Login.model';

interface AuthProps {
    authState?: {
        token: string | null; authenticated: boolean | null
    };
    onRegister?: (data: RegisterFormData) => Promise<void>;
    onLogin?: (data: LoginFormData) => Promise<void>;
    onLogout?: () => Promise<void>;
    onForgotPassword?: (data: any) => Promise<void>; //to type later
    onResetPassword?: (data:any) => Promise<void>; //to type later
}

const AuthContext = createContext<AuthProps>({});

export const AuthProvider: React.FC = ({ children }) => { //type children later
    const [authState, setAuthState] = useState(
        {
            token: null,
            authenticated : null
        }
    );

    async function storeDataToLocalStorage(key: string, value: string) {
        try {
            await AsyncStorage.setItem(key, value)
        } catch (e) {
            // saving error
            console.log('error storing the data in localstorage');
        }
    }

    async function retrieveDataFromLocalStorage(key:string) {
        try {
            const value = await AsyncStorage.getItem(key)
            if (value !== null) {
                // value previously stored
                return value;
            }
        } catch (e) {
            // error reading value
            console.log('error retrieving the data from localstorage');
        }
    }

    async function removeDataFromLocalStorage(key:string) {
        try {
            await AsyncStorage.removeItem(key)
        } catch (e) {
            // error removing value
            console.log('error removing the data from localstorage');
        }
    }

    useEffect(() => {
        const token = retrieveDataFromLocalStorage('token');
        if (token !== null) {
            setAuthState({ token, authenticated: true });
        }
    }, []);

    const onRegister = async (data: RegisterFormData) => {
        try {
            const response = await axios.post('http://localhost:3000/api/auth/register', data);
            console.log(response);
            storeDataToLocalStorage('token', response.data.token);
            setAuthState({ token: response.data.token, authenticated: true });
        } catch (error: any) {
            console.log(error);
            if (error.response) {
                console.log('Error during registration:', error.response.data);
            } else {
                console.log('Error during registration:', error.message);
            }
        }
    };

    const onLogin = async (data: LoginFormData) => {
        try {
            const response = await axios.post('http://localhost:3000/api/auth/login', data);
            console.log(response);
            storeDataToLocalStorage('token', response.data.token);
            setAuthState({ token: response.data.token, authenticated: true });
        } catch (error: any) {
            console.log(error);
            if (error.response) {
                console.log('Error during login:', error.response.data);
            } else {
                console.log('Error during login:', error.message);
            }
        }
    };

    const onLogout = async () => {
        try {
            removeDataFromLocalStorage('token');
            setAuthState({ token: null, authenticated: false });
        } catch (error: any) {
            console.log(error);
            if (error.response) {
                console.log('Error during logout:', error.response.data);
            } else {
                console.log('Error during logout:', error.message);
            }
        }
    };

    // const onChangePassword = async (data: ChangePasswordFormData) => {
    //     try {
    //         const response = await axios.post('http://localhost:3000/api/password/change-password', data);
    //         console.log(response);
    //         storeDataToLocalStorage('token', response.data.token);
    //         setAuthState({ token: response.data.token, authenticated: true });
    //     } catch (error: any) {
    //         console.log(error);
    //         if (error.response) {
    //             console.log('Error during change:', error.response.data);
    //         } else {
    //             console.log('Error during change:', error.message);
    //         }
    //     }
    // };
    const onForgotPassword = async (data: any) => {
        try {
            const response = await axios.post('http://localhost:3000/api/password/forgot-password', data);
            console.log(response);
            storeDataToLocalStorage('token', response.data.token);
            setAuthState({ token: response.data.token, authenticated: true });
        } catch (error: any) {
            console.log(error);
            if (error.response) {
                console.log('Error during change:', error.response.data);
            } else {
                console.log('Error during change:', error.message);
            }
        }
    };

    const onResetPassword = async (data: any) => {
        try {
            const response = await axios.post('http://localhost:3000/api/password/reset-password', data);
            console.log(response);
            storeDataToLocalStorage('token', response.data.token);
            setAuthState({ token: response.data.token, authenticated: true });
        } catch (error: any) {
            console.log(error);
            if (error.response) {
                console.log('Error during change:', error.response.data);
            } else {
                console.log('Error during change:', error.message);
            }
        }
    };

    return (
        <AuthContext.Provider
            value={{
                authState,
                onRegister,
                onLogin,
                onLogout,
                onForgotPassword,
                onResetPassword,
            }}
        >
            {children}
        </AuthContext.Provider>
    );
};

export const useAuthContext = () => useContext(AuthContext);
