import { View, ActivityIndicator } from 'react-native'
import React, { useContext } from 'react'
import { NavigationContainer } from '@react-navigation/native'
import StackNavigator from './StackNavigator'
import { AuthContext } from '../context/AuthContextTest'

const AppNav = () => {

    const { isLoading } = useContext(AuthContext);

    if (isLoading) {
        return (
            <View style={{
                flex: 1,
                justifyContent: 'center',
                alignItems: 'center'
            }}>
                <ActivityIndicator />
            </View>

        )
    }

    return (
        <NavigationContainer>
            <StackNavigator />
        </NavigationContainer>
    )
}

export default AppNav