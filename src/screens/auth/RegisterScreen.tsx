import React, { useState } from 'react';
import { View, Text, TextInput, StyleSheet } from 'react-native';
import { useForm, Controller } from 'react-hook-form';
import appTheme from '../../constants/theme';
import Button from '../../components/Button';
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
        <View style={styles.container}>
            <Text style={appTheme.STYLES.subtitle}>Register</Text>

            <Controller
                control={control}
                render={() => (
                    <TextInput
                        style={styles.input}
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
            {errors.first_name && <Text style={styles.errorText}>{errors.first_name.message}</Text>}
            <Controller
                control={control}
                render={({ field: { onChange, onBlur, value } }) => (
                    <TextInput
                        style={styles.input}
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
            {errors.last_name && <Text style={styles.errorText}>{errors.last_name.message}</Text>}

            <Controller
                control={control}
                render={({ field: { onChange, onBlur, value } }) => (
                    <TextInput
                        style={styles.input}
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
            {errors.email && <Text style={styles.errorText}>{errors.email.message}</Text>}
            <Controller
                control={control}
                render={({ field: { onChange, onBlur, value } }) => (
                    <TextInput
                        style={styles.input}
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
            {errors.birth_date && <Text style={styles.errorText}>{errors.birth_date.message}</Text>}

            <Controller
                control={control}
                render={({ field: { onChange, onBlur, value } }) => (
                    <TextInput
                        style={styles.input}
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
            {errors.password && <Text style={styles.errorText}>{errors.password.message}</Text>}

            <Controller
                control={control}
                render={({ field: { onChange, onBlur, value } }) => (
                    <TextInput
                        style={styles.input}
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
                <Text style={styles.errorText}>{errors.confirm_password.message}</Text>
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
}); // à enlever après 

export default RegisterScreen;
