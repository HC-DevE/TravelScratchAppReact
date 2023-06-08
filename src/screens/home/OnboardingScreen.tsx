import React from 'react';
import { View, Text, TouchableOpacity, ImageBackground, Image, SafeAreaView } from 'react-native';
import { useNavigation } from '@react-navigation/native';


const OnboardingScreen: React.FC = () => {
    const navigation = useNavigation();

    const handleStart = () => {
        navigation.navigate('Welcome');
    };

    return (
        // background image
        <View className="flex-1 flex-col justify-center">
            <ImageBackground source={require('../../assets/images/travel2.jpg')}
                className="flex-1 justify-top align-center ">
                <View className="flex-1">
                    {/* logo image */}
                    <Image source={require('../../assets/images/logo-noir.png')}
                        className="w-full h-20">
                    </Image>
                    {/* title */}
                    <Text className="text-white text-center font-bold text-3xl mt-10">Welcome!</Text>
                    {/* subtitle */}
                    <Text className="text-white text-center font-normal text-sm mt-1">Travel, scratch, share !</Text>
                    {/* button */}
                    <View className="flex flex-col items-center bottom-20 w-full absolute">
                        <TouchableOpacity onPress={handleStart}
                            className=" bg-[#0099CC] py-2 rounded-full w-40 items-center mt-50 ml-50">
                            <Text className="text-white text-lg font-bold">Start</Text>
                        </TouchableOpacity>
                    </View>

                </View>
            </ImageBackground>
        </View>

    );
};

export default OnboardingScreen;
