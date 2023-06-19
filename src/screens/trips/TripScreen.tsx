import { View, Text, Button, ScrollView, TouchableOpacity, TextInput, SafeAreaView } from 'react-native'
import React, { useEffect, useState } from 'react'
import { getTrips, getUserTrips } from './GetTrips'
import { TripData } from '../../models/Trip.model';
import { useAuth } from '../../context/AuthContext';
import Icon from 'react-native-ionicons';
import TripCardContainer from '../../components/TripCards';
import { Ionicons, AntDesign, EvilIcons } from '@expo/vector-icons';
import FilterCardComponent from '../../components/FilterCard';
import { MagnifyingGlassIcon, BeakerIcon, MagnifyingGlassPlusIcon, PlusIcon, PhoneArrowDownLeftIcon } from 'react-native-heroicons/outline';



const TripScreen = () => {
    //data
    const [trips, setTrips] = useState([]);
    const [error, setError] = useState([]);
    const [isLoading, setIsLoading] = useState(false);
    const { onLogout } = useAuth();
    //functions
    const addTrip = () => {
        //navigates to tripScreen
        // navigation.navigate('TripScreen');
    }

    //useEffect
    useEffect(() => {
        setIsLoading(true);
        getTrips()
            .then((data: any) => {
                setTrips(data);
            })
            .catch((error) => {
                setError(error);
            })
            .finally(() => {
                setIsLoading(false);
            });
    }, []);

    //get medias from trips
    // const getMedias = async (tripId: string) => {
    //     try {
    //         const response = await axios.get(`${DISTANT_API_URL}medias/${tripId}`);
    //         const medias = response.data.medias;
    //         return medias;
    //     } catch (error) {
    //         console.log(error);
    //     }
    // };

    // const searchTrips = async (searchInput: string) => {
    //     try {
    //         const response = await axios.get(`${DISTANT_API_URL}trips/search/${searchInput}`);
    //         const trips = response.data.trips;
    //         setTrips(trips);
    //     } catch (error) {
    //         console.log(error);
    //     }
    // };


    return (
        <ScrollView className="flex-1 bg-white dark:bg-gray-900 ">
            {/* <SafeAreaView> */}
            <View className=" p-4 flex-row justify-between rounded-lg mt-5">
                <Text className="font-bold text-[30px] color-[#0099CC]">Mes voyages</Text>
                <TouchableOpacity className="text-white justify-center items-center font-bold text-[20px] bg-[#0099CC] rounded-full h-10 w-10"
                    // onPress={() => navigation.navigate('AddTrip')}
                    onPress={onLogout}
                >
                    <PlusIcon size="24" color="white" strokeWidth={1} />

                </TouchableOpacity>
            </View>

            <View className="flex flex-row flex-wrap px-2">
                <TouchableOpacity className="flex-1 flex-row justify-start items-center bg-white border border-black rounded-full h-12 w-20 m-2 pl-4 active:border-[#0099CC]">
                    <MagnifyingGlassIcon size="24" color="black" strokeWidth={2} />

                    <TextInput
                        className="pl-2 flex-1"
                        onChangeText={
                            (value) => {
                                //if(value.length > 3){
                                //searchTrips(value);
                                // }
                            }
                        }
                        // value={searchInput}
                        placeholder="Search"
                    />


                </TouchableOpacity>
            </View>

            <View className="flex-1 px-4 mt-1 flex-row items-center justify-between">
                <FilterCardComponent category="Test filter" />
                <FilterCardComponent category="Test filter" />
                <FilterCardComponent category="Test filter" />
                <FilterCardComponent category="Test filter" />
            </View>
            <View className="flex-1 px-4 mt-8 flex-col items-center justify-center flex-wrap">
                {trips?.length > 0 ? (
                    <>
                        {
                            trips.map((trip: TripData, i) => {
                                return (
                                    <TripCardContainer
                                        className=""
                                        key={i}
                                        imageUrl={""}
                                        title={trip.title}
                                        location=""
                                        members="" />
                                )

                            })
                        }
                    </>
                ) : (<Text>No trips</Text>)}
            </View>
            <Button title="Logout" onPress={addTrip} className="my-2" />
            {/* </SafeAreaView> */}
        </ScrollView>


    )
}

export default TripScreen

