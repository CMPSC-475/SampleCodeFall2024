"use client"
import { VStack, HStack, Text } from "@chakra-ui/react"
import { useFlights } from "@/hooks/useFlights"
import { Flight } from "@/Models/Flight"
import { Input, Button } from "@chakra-ui/react"
import React, { useEffect } from "react"
import FlightsTable from "@/components/FlightsTable"
import { addFlight, getBookedFlights, getFlights } from "../api/AtlasAPI"
import { BookedFlight } from "@/Models/Flight"

// admin page where user can add a flight
export default function Admin() {
    const { flights, setFlights } = useFlights()
    const [bookedFlights, setBookedFlights] = React.useState<BookedFlight[]>([])

    const fetchFlights = async () => {
        const updatedFlights = await getFlights()
        setFlights(updatedFlights)
    }

    useEffect(() => {
        // get booked flights
        getBookedFlights()
            .then((bookedFlights) => {
                setBookedFlights(bookedFlights)
            })
    }, [])

    return (
        <VStack>
            <FlightsTable flights={flights} />
            <AddFlightForm addFlight={addFlight} onFlightAdded={fetchFlights} />
            {bookedFlights.length > 0 && 
                <VStack>
                    <Text fontSize={"2xl"} fontWeight={"bold"} color={"black"}>
                        Booked Flights
                    </Text>
                    {bookedFlights.map((bookedFlight) => (
                        <HStack key={bookedFlight.flight_id}>
                            <Text>{bookedFlight.flight_id} | </Text>
                            <Text>{bookedFlight.passenger_email} | </Text>
                            <Text>{bookedFlight.passenger_name}</Text>
                        </HStack>
                    ))}
                </VStack>
            }
        </VStack>
    )
}

export function AddFlightForm({ addFlight, onFlightAdded } : { addFlight: (flight: Flight) => void, onFlightAdded: () => void }) {
    const [flight, setFlight] = React.useState<Flight>({
        id: 0,
        flight_id: '',
        origin: '',
        destination: '',
        departure: '',
        arrival: '',
        price: 0
    })

    const handleAddFlight = async () => {
        await addFlight(flight)
        onFlightAdded()  // Fetch updated flights after adding
        setFlight({ id: 0, flight_id: '', origin: '', destination: '', departure: '', arrival: '', price: 0 }) // Reset form
    }

    return (
        <VStack>
            <Input placeholder="Flight Number" value={flight.flight_id} onChange={(e) => setFlight({...flight, flight_id: e.target.value})}/>
            <Input placeholder="Origin" value={flight.origin} onChange={(e) => setFlight({...flight, origin: e.target.value})}/>
            <Input placeholder="Destination" value={flight.destination} onChange={(e) => setFlight({...flight, destination: e.target.value})}/>
            <Input placeholder="Departure" value={flight.departure} onChange={(e) => setFlight({...flight, departure: e.target.value})}/>
            <Input placeholder="Arrival" value={flight.arrival} onChange={(e) => setFlight({...flight, arrival: e.target.value})}/>
            <Input placeholder="Price" value={flight.price} onChange={(e) => setFlight({...flight, price: parseInt(e.target.value)})}/>
            <Button onClick={handleAddFlight}>Add Flight</Button>
        </VStack>
    )
}
