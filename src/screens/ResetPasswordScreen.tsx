import React from 'react';
import { View, Text, TextInput, Button, StyleSheet } from 'react-native';
import { useForm, Controller } from 'react-hook-form';
import axios from 'axios';

interface ResetPasswordFormData {
    newPassword: string;
    confirmPassword: string;
}

const ResetPasswordScreen = () => {
    const {
        control,
        handleSubmit,
        formState: { errors },
        watch,
    } = useForm<ResetPasswordFormData>();

    const onSubmit = async (data: ResetPasswordFormData) => {
        try {
            // Replace with your API endpoint
            const response = await axios.post('http://10.0.2.2:3000/api/password/reset-password', {
                newPassword: data.newPassword,
                confirmPassword: data.confirmPassword,
            });

            console.log('Password reset successful:', response.data);
        } catch (error: any) {
            console.log('Error during password reset:', error.response.data);
        }
    };

    return (
        <View style={styles.container}>
            <Text style={styles.title}>Reset Password</Text>

            <Controller
                control={control}
                render={({ field: { onChange, onBlur, value } }) => (
                    <TextInput
                        style={styles.input}
                        onBlur={onBlur}
                        onChangeText={onChange}
                        value={value}
                        placeholder="New Password"
                        secureTextEntry
                    />
                )}
                name="newPassword"
                rules={{
                    required: 'New password is required',
                    minLength: {
                        value: 8,
                        message: 'Password must be at least 8 characters',
                    },
                }}
                defaultValue=""
            />
            {errors.newPassword && <Text style={styles.errorText}>{errors.newPassword.message}</Text>}

            <Controller
                control={control}
                render={({ field: { onChange, onBlur, value } }) => (
                    <TextInput
                        style={styles.input}
                        onBlur={onBlur}
                        onChangeText={onChange}
                        value={value}
                        placeholder="Confirm New Password"
                        secureTextEntry
                    />
                )}
                name="confirmPassword"
                rules={{
                    required: 'Please confirm your new password',
                    validate: value =>
                        value === watch('newPassword') || 'Passwords do not match',
                }}
                defaultValue=""
            />
            {errors.confirmPassword && (
                <Text style={styles.errorText}>{errors.confirmPassword.message}</Text>
            )}

            <Button title="Reset Password" onPress={handleSubmit(onSubmit)} />
        </View>
    );
};

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        padding: 16,
    },
    title: {
        fontSize: 24,
        marginBottom: 24,
    },
    input: {
        borderWidth: 1,
        borderColor: 'gray',
        paddingHorizontal: 12,
        paddingVertical: 8,
        marginBottom: 16,
    },
    errorText: {
        color: 'red',
        marginBottom: 16,
    },
});

export default ResetPasswordScreen;
