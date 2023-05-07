import { createContext, useContext, useEffect, useState } from "react";
import axios from "axios";
import { RegisterFormData } from "../models/Register.model";
import AsyncStorage from "@react-native-async-storage/async-storage";
import { LoginFormData } from "../models/Login.model";
import { API_URL } from "../config/config";

interface AuthProps {
    authState?: { token: string | null; authenticated: boolean | null };
    isLoading?: boolean;
    onRegister?: (data: RegisterFormData) => Promise<any>;
    onLogin?: (data: LoginFormData) => Promise<any>;
    onLogout?: () => Promise<any>;
    onForgotPassword?: (data: { email: string }) => Promise<any>;
}

const TOKEN_KEY = "jwt-auth-token";
const AuthContext = createContext<AuthProps>({});
export const useAuth = () => {
    return useContext(AuthContext);
};

export const AuthProvider = ({ children }: any) => {
    const [authState, setAuthState] = useState<{
        token: string | null;
        authenticated: boolean;
    }>({
        token: null,
        authenticated: false,
    });
    const [isLoading, setIsLoading] = useState<boolean>(false);

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
        setIsLoading(true);
        const { password, confirm_password, ...newData } = data;
        try {
            const response = await axios.post(`${API_URL}auth/register`, {
                ...newData,
                password_hash: password,
            });
            setIsLoading(false);
            return response.data;
        } catch (error: any) {
            setIsLoading(false);
            const responseData = error?.response?.data;
            return {
                error: responseData?.error,
                message: responseData?.message,
            };
        }
    }


    const onLogin = async (data: LoginFormData) => {
        setIsLoading(true);
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
            setIsLoading(false);
            return response.data;
        } catch (error: any) {
            setIsLoading(false);
            if (error.response) {
                console.log("Error during login:", error.response.data);
                return error.response.data;
            } else {
                console.log("Error during login:", error.message);
                return error.message;
            }
        }
    };

    const onLogout = async () => {
        //Remove the token from local storage
        removeDataFromLocalStorage(TOKEN_KEY);
        //Update the HTTP Headers
        axios.defaults.headers.common["Authorization"] = "";
        //Reset the auth state
        setAuthState({ token: null, authenticated: false });
    };

    //forgotpassword
    const onForgotPassword = async (data: { email: string }) => {
        setIsLoading(true);
        try {
            const response = await axios.post(`${API_URL}password/forgot-password`, {
                email: data.email,
            });
            setIsLoading(false);
            return response.data;
        } catch (error: any) {
            setIsLoading(false);
            if (error.response) {
                console.log("Error during forgot password:", error.response.data);
                return error.response.data;
            } else {
                console.log("Error during forgot password:", error.message);
                return error.message;
            }
        }
    };


    const value = {
        authState,
        isLoading,
        onRegister,
        onLogin,
        onLogout,
        onForgotPassword,
    };
    return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
};

export const useAuthContext = () => useContext(AuthContext);
