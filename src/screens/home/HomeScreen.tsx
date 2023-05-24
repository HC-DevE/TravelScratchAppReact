//homescreen
import React from 'react';
import { View, Text, Button } from 'react-native';
import { StackNavigationProp } from '@react-navigation/stack';
import { useAuth } from '../../context/AuthContext';

interface HomeScreenProps {
    navigation: StackNavigationProp<any, 'Home'>;
}

const HomeScreen: React.FC<HomeScreenProps> = () => {
    const { onLogout } = useAuth();

    return (
        <View className="flex-1 justify-center items-center">
            <Text className="text-2xl font-bold mb-4">Home</Text>
            <Text className="text-2xl font-bold dark:text-white mb-2"> Welcome to the Home Screen</Text>
            <Button title="Logout" onPress={onLogout} className="my-2" />
        </View>
    );

};


export default HomeScreen;