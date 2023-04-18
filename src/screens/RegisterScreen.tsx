import React from 'react';
import { View, Text, TextInput, Button, StyleSheet } from 'react-native';
import { useForm, Controller } from 'react-hook-form';
import axios from 'axios';
import { useNavigation } from '@react-navigation/native';
import { StackNavigationProp } from '@react-navigation/stack';

interface RegisterFormData {
    first_name: string;
    last_name: string;
    email: string;
    password: string;
    confirmPassword: string;
    phone?: string;
    birth_date: string;
    gender: string;
}
interface RegisterScreenProps {
    navigation: StackNavigationProp<any, 'Register'>;
}

// const navigation = useNavigation();
const RegisterScreen: React.FC<RegisterScreenProps> = ({ navigation }) => {
    const {
        control,
        handleSubmit,
        formState: { errors },
        watch,
    } = useForm<RegisterFormData>();


    const onSubmit = async (data: RegisterFormData) => {
        try {
            const response = await axios.post('http://10.0.2.2:3000/api/auth/register', {
                first_name: data.first_name,
                last_name: data.last_name,
                email: data.email,
                password_hash: data.password,
                birth_date: data.birth_date,
                gender: data.gender ? data.gender : 'other',
            });

            console.log('Registration successful:', response.data);
        } catch (error: any) {
            console.log(error);
            if (error.response) {
                console.log('Error during registration:', error.response.data);
            } else {
                console.log('Error during registration:', error.message);
            }
        }
    };

    return (
        <View style={styles.container}>
            <Text style={styles.title}>Register</Text>

            <Controller
                control={control}
                render={({ field: { onChange, onBlur, value } }) => (
                    <TextInput
                        style={styles.input}
                        onBlur={onBlur}
                        onChangeText={onChange}
                        value={value}
                        placeholder="First Name"
                    />
                )}
                name="first_name"
                rules={{ required: 'First name is required' }}
                defaultValue=""
            />
            {errors.first_name && <Text style={styles.errorText}>{errors.first_name.message}</Text>}

            <Controller
                control={control}
                render={({ field: { onChange, onBlur, value } }) => (
                    <TextInput
                        style={styles.input}
                        onBlur={onBlur}
                        onChangeText={onChange}
                        value={value}
                        placeholder="Last Name"
                    />
                )}
                name="last_name"
                rules={{ required: 'Last name is required' }}
                defaultValue=""
            />
            {errors.last_name && <Text style={styles.errorText}>{errors.last_name.message}</Text>}

            <Controller
                control={control}
                render={({ field: { onChange, onBlur, value } }) => (
                    <TextInput
                        style={styles.input}
                        onBlur={onBlur}
                        onChangeText={onChange}
                        value={value}
                        placeholder="Email"
                    />
                )}
                name="email"
                rules={{
                    required: 'Email is required',
                    pattern: {
                        value: /^\S+@\S+$/i,
                        message: 'Invalid email address',
                    },
                }}
                defaultValue=""
            />
            {errors.email && <Text style={styles.errorText}>{errors.email.message}</Text>}
            <Controller
                control={control}
                render={({ field: { onChange, onBlur, value } }) => (
                    <TextInput
                        style={styles.input}
                        onBlur={onBlur}
                        onChangeText={onChange}
                        value={value}
                        placeholder="Birth Date"
                    />
                )}
                name="birth_date"
                rules={{
                    required: 'Birth date is required',
                    pattern: {
                        value: /^\d{4}-\d{2}-\d{2}$/i,
                        message: 'Invalid birth date',
                    },
                }}
                defaultValue=""
            />

            <Controller
                control={control}
                render={({ field: { onChange, onBlur, value } }) => (
                    <TextInput
                        style={styles.input}
                        onBlur={onBlur}
                        onChangeText={onChange}
                        value={value}
                        placeholder="Password"
                        secureTextEntry
                    />
                )}
                name="password"
                rules={{
                    required: 'Password is required',
                    minLength: {
                        value: 8,
                        message: 'Password must be at least 8 characters',
                    },
                }}
                defaultValue=""
            />
            {errors.password && <Text style={styles.errorText}>{errors.password.message}</Text>}

            <Controller
                control={control}
                render={({ field: { onChange, onBlur, value } }) => (
                    <TextInput
                        style={styles.input}
                        onBlur={onBlur}
                        onChangeText={onChange}
                        value={value}
                        placeholder="Confirm Password"
                        secureTextEntry
                    />
                )}
                name="confirmPassword"
                rules={{
                    required: 'Please confirm your password',
                    validate: value =>
                        value === watch('password') || 'Passwords do not match',
                }}

                defaultValue=""
            />
            {errors.confirmPassword && (
                <Text style={styles.errorText}>{errors.confirmPassword.message}</Text>
            )}

            <Button title="Register" onPress={handleSubmit(onSubmit)} />
            <Button title="Back to Login" onPress={() => navigation.navigate(
                'Login'
            )} />
        </View>
    );

};

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        paddingHorizontal: 16,
    },
    title: {
        fontSize: 24,
        fontWeight: 'bold',
        marginBottom: 16,
    },
    input: {
        height: 40,
        borderColor: 'gray',
        borderWidth: 1,
        paddingHorizontal: 8,
        marginBottom: 8,
    },
    errorText: {
        color: 'red',
        marginBottom: 8,
    }
});

export default RegisterScreen;
