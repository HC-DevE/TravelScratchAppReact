import { Text, TouchableOpacity } from 'react-native'
import React from 'react'
import appTheme from '../constants/theme'
import { ButtonProps } from '../models/Button.model'

const Button = (props: ButtonProps) => {
    return (
        <TouchableOpacity
            onPress={props.onPress}
            style={{
                ...appTheme.STYLES.button,
                backgroundColor: props.disabled ? appTheme.COLORS.silver : appTheme.COLORS.facebook,
            }}
        >
            <Text
                style={{
                    ...appTheme.STYLES.text,
                    color: props.disabled ? appTheme.COLORS.black : appTheme.COLORS.white,
                }}>
                {props.title}
            </Text>
        </TouchableOpacity>
    )
}

export default Button