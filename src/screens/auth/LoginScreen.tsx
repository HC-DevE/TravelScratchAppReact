import React, { useState } from 'react';
import { useForm, Controller } from 'react-hook-form';
import { LoginFormData } from '../../models/Login.model';
import { StackNavigationProp } from '@react-navigation/stack';
import { useAuth } from '../../context/AuthContext';
import { View, Text, TextInput, Button, StyleSheet } from 'react-native';



// interface LoginScreenProps {
//     navigation: StackNavigationProp<any, 'Login'>;
// }

const LoginScreen = () => {

    //useContext of 2nd method
    const [email, setEmail]: [string | null, Function] = useState('');
    const [password, setPassword]: [string | null, Function] = useState('');
    const { onLogin, onRegister } = useAuth();

    const login = async () => {
        const result = await onLogin!({ email, password });
        if (result && result.error) {
            console.log(result.msg);
        }
    };

    // const register = async (data: RegisterFormData) => {
    //     const result = await onRegister!(data); // RegisterFormData
    //     if (result && result.error) {
    //         console.log(result.msg);
    //     } else {
    //         login();
    //     }
    // };


    //useContext of 1st method
    // const { onLogin } = useContext(AuthContext);
    // const [email, setEmail]: [string | null, Function] = useState(null);
    // const [password, setPassword]: [string | null, Function] = useState(null);
    
    const {
        control,
        // handleSubmit,
        formState: { errors },
    } = useForm<LoginFormData>();

    return (
        <View style={styles.container}>
            <Text style={styles.title}>Login</Text>

            <Controller
                control={control}
                render={({ field: { onChange, onBlur, value } }) => (
                    <TextInput
                        style={styles.input}
                        onBlur={onBlur}
                        onChangeText={
                            (value) => {
                                onChange(value);
                                setEmail(value);
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
                                setPassword(value);
                            }
                        }
                        // onChangetext={
                        //     (text: string) => setPassword(text)
                        // }
                        value={value}
                        placeholder="Password"
                        secureTextEntry={true}
                    />
                )}
                name="password"
                rules={{
                    required: 'Password is required',
                }}
                defaultValue=""
            />
            {errors.password && <Text style={styles.errorText}>{errors.password.message}</Text>}
            {/* <Button title="Login" onPress={() => { onLogin!({ email, password }); }} /> */}
            <Button title="Sign In" onPress={login} />
            {/* <Button title="Create an account" onPress={register} /> */}
            {/* <Button title="Forgot Password" onPress={onForgotPassword} /> */}
        </View>
    );

};

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        paddingHorizontal: 20,
    },
    title: {
        fontSize: 24,
        fontWeight: 'bold',
        marginBottom: 20,
        textAlign: 'center',
    },
    input: {
        borderWidth: 1,
        borderColor: '#ccc',
        borderRadius: 5,
        paddingHorizontal: 10,
        paddingVertical: 5,
        marginBottom: 10,
    },
    errorText: {
        color: 'red',
        marginBottom: 10,
    },
});


export default LoginScreen;

