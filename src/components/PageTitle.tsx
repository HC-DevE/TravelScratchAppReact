import { View, Text } from 'react-native'
import React from 'react'
import { PageTitle } from '../models/PageTitle.model'

const PageTitle = (props: PageTitle) => {
  return (
    <View>
      <Text>{props.title}</Text>

      <Text>{props.subtitle}</Text>
    </View>
  )
}

export default PageTitle