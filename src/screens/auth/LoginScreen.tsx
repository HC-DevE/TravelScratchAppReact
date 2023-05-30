import React, { useState } from 'react';
import { useForm, Controller } from 'react-hook-form';
import { LoginFormData } from '../../models/Login.model';
import { StackNavigationProp } from '@react-navigation/stack';
import { useAuth } from '../../context/AuthContext';
import { View, Text, TextInput, Button, StyleSheet, TouchableOpacity } from 'react-native';



interface LoginScreenProps {
    navigation: StackNavigationProp<any, 'Login'>;
}

const LoginScreen: React.FC<LoginScreenProps> = ({ navigation }) => {

    //useContext method //TODO:useRef instead because no need to track value onChange for the fields
    const [email, setEmail]: [string | null, Function] = useState('');
    const [password, setPassword]: [string | null, Function] = useState('');
    const { onLogin } = useAuth();

    const login = async () => {
        const result = await onLogin!({ email, password });
        if (result && result.error) {
            console.log(result.msg);
        }
    };


    const {
        control,
        // handleSubmit,
        formState: { errors },
    } = useForm<LoginFormData>({
        defaultValues: {
            email: '',
            password: '',
        },
        mode: 'onChange'
    });

    return (
        <View className={styles2.container}>
            <Text className={styles2.title}>Login</Text>

            <Controller
                control={control}
                render={({ field: { onChange, onBlur, value } }) => (
                    <TextInput
                        className={styles2.input}
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
                        className={styles2.input}
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
            {errors.password && <Text className={styles2.errorText}>{errors.password.message}</Text>}
            <TouchableOpacity className={styles2.button} onPress={login}>
                <Text className={styles2.buttonText}>Login</Text>
            </TouchableOpacity>
            <Button title="Forget Password" onPress={() => {
                navigation.navigate('ForgotPassword');
            }} />
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

const styles2 = {
    container: 'flex-1 justify-top px-[20px]',
    title: 'text-2xl font-bold mb-4 text-center color-[#0099CC]',
    text: 'text-2xl font-bold dark:text-white mb-2',
    button: 'my-2 rounded',
    buttonText: 'text-xl font-bold dark:text-white',
    input: 'w-full p-2 border border-gray-300 rounded-lg focus:outline-none focus:border-blue-300',
    errorText: 'text-red-500 mb-2',
}


export default LoginScreen;

