import React from 'react';
import { View, Text, TextInput, Button, StyleSheet } from 'react-native';
import { useForm, Controller } from 'react-hook-form';
import axios from 'axios';
import { StackNavigationProp } from '@react-navigation/stack';



interface LoginScreenProps {
    navigation: StackNavigationProp<any, 'Login'>;
}


interface LoginFormData {
    email: string;
    password: string;
}

const LoginScreen: React.FC<LoginScreenProps> = ({ navigation }) => {
    const {
        control,
        handleSubmit,
        formState: { errors },
    } = useForm<LoginFormData>();

    // onSubmit method
    const onSubmit = async (data: LoginFormData) => {
        try {
            const response = await axios.post('https://mdp04.mdstestangers.fr/api/auth/login', {
                email: data.email,
                password_hash: data.password,
            });

            console.log(response);

            // Save the token from the response to a variable that we will use later
            const token = response.data.token;

            // Save the token to AsyncStorage but it's not very secure
            //   await AsyncStorage.setItem('token', token);

            // Save the token to the axios default headers
            axios.defaults.headers.common['Authorization'] = token;

            //or save it to the keychain of react
            // await Keychain.setGenericPassword('token', token);

            // Navigate to the home screen or another screen after successful login
            navigation.navigate('Home');
        } catch (error: any) {
            if (error.response) {
                console.log('Error during login:', error.response.data);
            } else {
                console.log('Error during login:', error.message);
            }
        }
    };

    return (
        <View style={styles.container}>
            <Text style={styles.title}>Login</Text>

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
                        placeholder="Password"
                        secureTextEntry
                    />
                )}
                name="password"
                rules={{
                    required: 'Password is required',
                }}
                defaultValue=""
            />
            {errors.password && <Text style={styles.errorText}>{errors.password.message}</Text>}

            <Button title="Login" onPress={handleSubmit(onSubmit)} />
            <Button title="Register" onPress={() => navigation.navigate('Register')} />
            <Button title="Forgot Password" onPress={() => navigation.navigate('ForgotPassword')} />
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