import { createContext, useContext, useEffect, useState } from "react";
import axios from "axios";
import { RegisterFormData } from "../models/Register.model";
import AsyncStorage from "@react-native-async-storage/async-storage";
import { LoginFormData } from "../models/Login.model";
import { API_URL } from "../config/config";

interface AuthProps {
    authState?: { token: string | null; authenticated: boolean | null };
    onRegister?: (data: RegisterFormData) => Promise<any>; // RegisterFormData
    onLogin?: (data: LoginFormData) => Promise<any>;
    onLogout?: () => Promise<any>;
}

const TOKEN_KEY = "jwt-auth-token";
const AuthContext = createContext<AuthProps>({});
export const useAuth = () => {
    return useContext(AuthContext);
};

export const AuthProvider = ({ children }: any) => {
    const [authState, setAuthState] = useState<{
        token: string | null;
        authenticated: boolean | null;
    }>({
        token: null,
        authenticated: null,
    });

    useEffect(() => {
        const checkToken = async () => {
            // Get token from local storage
            const token = await retrieveDataFromLocalStorage(TOKEN_KEY);
            if (token) {
                // set the HTTP Headers
                axios.defaults.headers.common["Authorization"] = `Bearer ${token}`;
                setAuthState({ token: token, authenticated: true });
            } else {
                setAuthState({ token: null, authenticated: false });
            }
        };
        checkToken();
    }, []);

    async function storeDataToLocalStorage(key: string, value: string) {
        try {
            const token = await AsyncStorage.setItem(key, value);
            return token;
        } catch (e) {
            // saving error
            console.log("error storing the data in localstorage");
        }
    }

    async function retrieveDataFromLocalStorage(key: string) {
        try {
            const value = await AsyncStorage.getItem(key);
            if (value !== null) {
                return value;
            }
        } catch (e) {
            console.log("error retrieving the data from localstorage");
        }
    }

    async function removeDataFromLocalStorage(key: string) {
        try {
            const token = await AsyncStorage.removeItem(key);
            return token;
        } catch (e) {
            console.log("error removing the data from localstorage");
        }
    }

    const onRegister = async (data: RegisterFormData) => {
        const { password, confirm_password, ...newData } = data;
        try {
            const response = await axios.post(`${API_URL}auth/register`, {
                ...newData,
                password_hash: password,
            });
            return response.data;
        } catch (error: any) {
            const responseData = error?.response?.data;
            return {
                error: responseData?.error,
                message: responseData?.message,
            };
        }
    }


    const onLogin = async (data: LoginFormData) => {
        try {
            const response = await axios.post(`${API_URL}auth/login`, {
                email: data.email,
                password_hash: data.password
            });
            // storeDataToLocalStorage(TOKEN_KEY, response.data.token);
            setAuthState({ token: response.data.token, authenticated: true });
            // set the HTTP Headers
            axios.defaults.headers.common[
                "Authorization"
            ] = `Bearer ${response.data.token}`;
            await AsyncStorage.setItem(TOKEN_KEY, response.data.token);
            console.log('from onLogin', response.data);
        } catch (error: any) {
            if (error.response) {
                console.log("Error during login:", error.response.data);
            } else {
                console.log("Error during login:", error.message);
            }
        }
    };

    const onLogout = async () => {
        removeDataFromLocalStorage(TOKEN_KEY);
        //Update the HTTP Headers
        axios.defaults.headers.common["Authorization"] = "";
        //Reset the auth state
        setAuthState({ token: null, authenticated: false });
    };


    const value = {
        authState,
        onRegister,
        onLogin,
        onLogout
    };
    return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
};

export const useAuthContext = () => useContext(AuthContext);
