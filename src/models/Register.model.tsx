import { StackNavigationProp } from "@react-navigation/stack";

export interface RegisterFormData {
    first_name?: string;
    last_name?: string;
    email: string;
    password: string;
    confirmPassword: string;
    phone?: string;
    birth_date?: string;
    gender?: string;
}

export interface RegisterScreenProps {
    navigation: StackNavigationProp<any, 'Register'>;
}