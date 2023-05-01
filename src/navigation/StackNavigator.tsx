import React, { useEffect } from 'react';
// import { View, ActivityIndicator } from 'react-native'
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import WelcomeScreen from '../screens/home/WelcomeScreen';
import RegisterScreen from '../screens/auth/RegisterScreen';
import LoginScreen from '../screens/auth/LoginScreen';
import HomeScreen from '../screens/home/HomeScreen';
import ForgotPasswordScreen from '../screens/auth/ForgotPasswordScreen';
import ResetPasswordScreen from '../screens/auth/ResetPasswordScreen';
import { useAuth } from '../context/AuthContext';

const Stack = createNativeStackNavigator();

const StackNavigator = () => {

    // const { isLoading, userToken, isAuthenticated } = useContext(AuthContext);
    const { authState } = useAuth();

    // useEffect(() => {}, []);

    // if (isLoading) {
    //     return (
    //         <View style={{
    //             flex: 1,
    //             justifyContent: 'center',
    //             alignItems: 'center'
    //         }}>
    //             <ActivityIndicator />
    //         </View>

    //     );
    // }

    return (
        <Stack.Navigator>
            {authState.authenticated ? (
                <Stack.Screen name="Home" component={HomeScreen} options={{ headerShown: false }} />
            ) : (
                <>
                    <Stack.Screen name="Welcome" component={WelcomeScreen} options={{ headerShown: false }} />
                    <Stack.Screen name="Login" component={LoginScreen} options={{ headerShown: false }} />
                    <Stack.Screen name="Register" component={RegisterScreen} options={{ headerShown: false }} />
                    <Stack.Screen name="ForgotPassword" component={ForgotPasswordScreen} />
                    <Stack.Screen name="ResetPassword" component={ResetPasswordScreen} />
                </>

            )}
        </Stack.Navigator>
    );
    // return (
    //     <Stack.Navigator>
    //         {userToken && isAuthenticated ? (
    //             <Stack.Screen name="Home" component={HomeScreen} options={{ headerShown: false }} />
    //         ) : (
    //             <>
    //                 <Stack.Screen name="Welcome" component={WelcomeScreen} options={{ headerShown: false }} />
    //                 <Stack.Screen name="Login" component={LoginScreen} options={{ headerShown: false }} />
    //                 <Stack.Screen name="Register" component={RegisterScreen} options={{ headerShown: false }} />
    //                 <Stack.Screen name="ForgotPassword" component={ForgotPasswordScreen} />
    //                 <Stack.Screen name="ResetPassword" component={ResetPasswordScreen} />
    //             </>

    //         )}
    //     </Stack.Navigator>
    // );



    // return (
    //     <Stack.Navigator initialRouteName={userToken && isAuthenticated ? 'Home' : 'Welcome'}>
    //         <Stack.Screen name="Welcome" component={WelcomeScreen} options={{ headerShown: false }} />
    //         <Stack.Screen
    //             name="Register"
    //             component={RegisterScreen}
    //             options={{ headerShown: false }}
    //         />
    //         <Stack.Screen
    //             name="Login"
    //             component={LoginScreen}
    //             options={{ headerShown: false }}
    //         />
    //         <Stack.Screen
    //             name="Home"
    //             component={HomeScreen}
    //             options={{ headerShown: false }}
    //         />
    //         <Stack.Screen
    //             name="ForgotPassword"
    //             component={ForgotPasswordScreen}
    //             options={{ headerShown: false }}
    //         />
    //         <Stack.Screen
    //             name="ResetPassword"
    //             component={ResetPasswordScreen}
    //             options={{ headerShown: false }}
    //         />
    //     </Stack.Navigator>
    // );
};

export default StackNavigator;