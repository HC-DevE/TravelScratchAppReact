//homescreen
import React from 'react';
import { View, Text, Button, StyleSheet } from 'react-native';
import { StackNavigationProp } from '@react-navigation/stack';
import axios from 'axios';
// import { connect } from 'react-redux';
// import { logout } from '../redux/actions/authActions';

interface HomeScreenProps {
    navigation: StackNavigationProp<any, 'Home'>;
}

const HomeScreen: React.FC<HomeScreenProps> = ({ navigation }) => {
    const logout = async () => {
        try {
            // const response = await axios.post('http://10.0.2.2:3000/auth/logout');

            // Remove the token from the axios default headers
            delete axios.defaults.headers.common['Authorization'];

            // Navigate to the welcome screen
            navigation.navigate('Welcome');
        } catch (error: any) {
            if (error.response) {
                console.log('Error during logout:', error.response.data);
            } else {
                console.log('Error during logout:', error.message);
            }
        }
    };

    return (
        <View style={styles.container}>
            <Text style={styles.title}>Home</Text>
            <Button title="Logout" onPress={logout} />
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

export default HomeScreen;