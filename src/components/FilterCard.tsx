import { View, Text, TouchableOpacity } from 'react-native'
import React from 'react'

const FilterCardComponent = ({ category }: any) => {
    return (
        <TouchableOpacity className="flex-1 flex-row rounded-md border-2 border-gray-200 mr-2">
            <View className="w-10 h-10 rounded-md ">
                <Text className="text-lg color-[#0099CC] dark:text-white">{category}</Text>
            </View>
        </TouchableOpacity>
    )
}

export default FilterCardComponent