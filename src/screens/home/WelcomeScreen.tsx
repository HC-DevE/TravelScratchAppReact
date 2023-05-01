import React from 'react';
import { View, Text, StyleSheet, Button } from 'react-native';
import { StackNavigationProp } from '@react-navigation/stack';

interface WelcomeScreenProps {
    navigation: StackNavigationProp<any, 'Welcome'>;
}

const WelcomeScreen: React.FC<WelcomeScreenProps> = ({ navigation }) => {
    return (
        <View style={styles.container}>
            <Text style={styles.title}>Welcome to Travel Scratch</Text>
            <Button
                title="Register"
                onPress={() => { navigation.navigate('Register') }}
            />
            <Button
                title="Login"
                onPress={() => { navigation.navigate('Login') }}
            />
        </View>
    );
};

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
    },
    title: {
        fontSize: 24,
        fontWeight: 'bold',
        marginBottom: 16,
    },
    button: {
        marginVertical: 8,
    }
});

export default WelcomeScreen;
