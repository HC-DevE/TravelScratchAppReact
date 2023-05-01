//homescreen
import React from 'react';
import { View, Text, Button, StyleSheet } from 'react-native';
import { StackNavigationProp } from '@react-navigation/stack';
import { useAuth } from '../../context/AuthContext';

interface HomeScreenProps {
    navigation: StackNavigationProp<any, 'Home'>;
}

const HomeScreen: React.FC<HomeScreenProps> = () => {
    const { onLogout } = useAuth();

    

    return (
        <View style={styles.container}>
            <Text style={styles.title}>Home</Text>
            <Button title="Logout" onPress={() => {
                onLogout()
            }} />
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