import { StackNavigationProp } from "@react-navigation/stack";

export interface RegisterFormData {
    first_name?: string;
    last_name?: string;
    email: string;
    password: string;
    confirm_password?: string;
    // birth_date?: string;
    gender?: string;
    preferences?: string;
}

export interface RegisterScreenProps {
    navigation: StackNavigationProp<any, 'Register'>;
}