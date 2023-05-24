import React, { useState } from 'react';
import { View, Text, Button, TextInput, StyleSheet } from 'react-native';
import { useForm, Controller } from 'react-hook-form';
import appTheme from '../../constants/theme';
// import Button from '../../components/Button';
import { RegisterFormData, RegisterScreenProps } from '../../models/Register.model';
import { useAuth } from '../../context/AuthContext';

const RegisterScreen: React.FC<RegisterScreenProps> = ({ navigation }) => {

    const [data, setData]: [any, Function] = useState('');
    // const { register, handleSubmit, errors } = useForm<RegisterFormData>();
    const { onLogin, onRegister } = useAuth();
    const { control, handleSubmit, formState: { errors }, watch } = useForm<RegisterFormData>();

    const login = async () => {
        const result = await onLogin!({
            email: data.email,
            password: data.password
        });
        if (result && result.error) {
            console.log(result.msg);
        }
    };

    const register = async (data: RegisterFormData) => {
        const result = await onRegister!(data);
        if (result && result.message !== 'User created successfully') {
            console.log(result.message);
        } else {
            login();
        }
    };




    return (
        <View className={styles.container}>
            <Text className={appTheme.STYLES.subtitle}>Register</Text>

            <Controller
                control={control}
                render={() => (
                    <TextInput
                        className={styles.input}
                        onChangeText={
                            (first_name) => {
                                setData({
                                    ...data,
                                    first_name: first_name
                                })
                            }
                        }
                        value={data.first_name}
                        placeholder="First Name"
                    />
                )}
                name="first_name"
                defaultValue=""
            />
            {errors.first_name && <Text className={styles.errorText}>{errors.first_name.message}</Text>}
            <Controller
                control={control}
                render={({ field: { onChange, onBlur, value } }) => (
                    <TextInput
                        className={styles.input}
                        onBlur={onBlur}
                        onChangeText={
                            (value) => {
                                onChange(value);
                                setData({
                                    ...data,
                                    last_name: value
                                })
                            }
                        }
                        value={value}
                        placeholder="Last Name"
                    />
                )}
                name="last_name"
                defaultValue=""
            />
            {errors.last_name && <Text className={styles.errorText}>{errors.last_name.message}</Text>}

            <Controller
                control={control}
                render={({ field: { onChange, onBlur, value } }) => (
                    <TextInput
                        className={styles.input}
                        onBlur={onBlur}
                        onChangeText={
                            (value) => {
                                onChange(value);
                                setData({
                                    ...data,
                                    email: value
                                })
                            }
                        }
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
            {errors.email && <Text className={styles.errorText}>{errors.email.message}</Text>}
            <Controller
                control={control}
                render={({ field: { onChange, onBlur, value } }) => (
                    <TextInput
                        className={styles.input}
                        onBlur={onBlur}
                        onChangeText={
                            (value) => {
                                onChange(value);
                                setData({
                                    ...data,
                                    birth_date: value,
                                })
                            }
                        }
                        value={value}
                        placeholder="Birth Date"
                    />
                )}
                name="birth_date"
                rules={{
                    pattern: {
                        value: /^\d{4}-\d{2}-\d{2}$/i,
                        message: 'Invalid birth date',
                    },
                }}
                defaultValue=""
            />
            {errors.birth_date && <Text className={styles.errorText}>{errors.birth_date.message}</Text>}

            <Controller
                control={control}
                render={({ field: { onChange, onBlur, value } }) => (
                    <TextInput
                        className={styles.input}
                        onBlur={onBlur}
                        onChangeText={
                            (value) => {
                                onChange(value);
                                setData({
                                    ...data,
                                    password: value
                                });
                            }
                        }

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
            {errors.password && <Text className={styles.errorText}>{errors.password.message}</Text>}

            <Controller
                control={control}
                render={({ field: { onChange, onBlur, value } }) => (
                    <TextInput
                        className={styles.input}
                        onBlur={onBlur}
                        onChangeText={
                            (value) => {
                                onChange(value);
                                setData({
                                    ...data,

                                });
                            }
                        }
                        value={value}
                        placeholder="Confirm Password"
                        secureTextEntry
                    />
                )}
                name="confirm_password"
                rules={{
                    required: 'Please confirm your password',
                    validate: value =>
                        value === watch('password') || 'Passwords do not match',
                }}

                defaultValue=""
            />
            {errors.confirm_password && (
                <Text className={styles.errorText}>{errors.confirm_password.message}</Text>
            )}

            <Button
                title="Register"
                onPress={handleSubmit(register)}
                color={''}
                disabled={watch('first_name') && watch('email') ? false : true} />
            <Button
                title="Back to Login"
                onPress={() => navigation.navigate('Login')}
                color={''}
                disabled={false} />
        </View>
    );

};

const styles = {
    container: 'flex-1 justify-center px-4',
    title: 'text-2xl font-bold mb-4',
    subtitle: 'text-2xl font-bold text-black text-center mb-4',
    input: 'h-10 border border-gray-300 px-2 mb-2',
    errorText: 'text-red-500 mb-2',
}; // à enlever après 

export default RegisterScreen;
