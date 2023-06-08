import { View, Text, TouchableOpacity, Image } from 'react-native'
import React from 'react'

const TripCardContainer = ({ imageUrl, title, country, members }: any) => {
    return (
        <TouchableOpacity className="flex-1 flex-row rounded-md border-x-1 border-b-2 border-t-0 border-gray-200 space-y-2 px-3 py-2 shadow-md shadow-gray-400 bg-white w-full space-x-3 mb-2">
            <Image className="w-[100px] h-[100px] rounded-md object-cover" source={{ uri: imageUrl ? imageUrl : 'https://travelscratch.fra1.digitaloceanspaces.com/uploads/images/9d8410de0e6ead570e771bfe3f1fa99f_1685229353091.jpeg' }} />
            <View className="flex-col justify-start items-start h-full">
                <Text className="text-sm dark:text-white">{country ? country : 'unkown country'}</Text>
                <Text className="text-lg color-[#0099CC] dark:text-white">{title?.length > 14 ? `${title.slice(0, 14)}...` : title}</Text>
                <Text className="text-sm dark:text-white">{members ? members : 'No members'}</Text>
            </View>
        </TouchableOpacity>
    )
}

export default TripCardContainer
