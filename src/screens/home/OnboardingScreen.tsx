import React from 'react';
import { View, Text, Button, TouchableOpacity } from 'react-native';
import { useNavigation } from '@react-navigation/native';

const OnboardingScreen: React.FC = () => {
    const navigation = useNavigation();

    const handleStart = () => {
        navigation.navigate('Welcome');
    };

    return (
        <View className="flex-1 justify-center items-center bg-gray-100 p-4">
            <Text className="text-3xl font-bold mb-6">Welcome to the Travel App!</Text>
            <Text className="text-lg mb-10">Discover new adventures around the world.</Text>
            <TouchableOpacity
                className="bg-blue-500 text-white py-2 px-4 rounded"
                onPress={handleStart}
            >
                <Text className="text-lg font-bold">Start</Text>
            </TouchableOpacity>
        </View>
    );
};

export default OnboardingScreen;
