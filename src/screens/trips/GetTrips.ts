import {View, Text} from 'react-native';
import React from 'react';
import {DISTANT_API_URL} from '../../config/config';
import {TripData} from '../../models/Trip.model';
import AsyncStorage from '@react-native-async-storage/async-storage';
import axios from 'axios';

const TOKEN_KEY = 'jwt-auth-token';

export const getTrips = async () => {
  try {
    const response = await axios.get(`${DISTANT_API_URL}trips/all`);
    const trips: TripData = response.data;
    return trips;
  } catch (error) {
    console.log(error);
  }
};

export const getUserTrips = async () => {
  try {
    const response = await axios.get(`${DISTANT_API_URL}trips/userTrips`, {
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + (await AsyncStorage.getItem(TOKEN_KEY)),
      },
    });
    const trips = response.data.trips;
    return trips;
  } catch (error) {
    console.log(error);
  }
};
