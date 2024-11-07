"use client"
import { Flight } from '../../Models/Flight'
import { useFlights } from '../../hooks/useFlights'
import FlightsTable from '../../components/FlightsTable'

interface FlightsProps {
    flights: Flight[]
}

export default function Flights (props : FlightsProps) {

    const {flights} = useFlights()


    return (
        <FlightsTable flights={flights}/>
    )
}