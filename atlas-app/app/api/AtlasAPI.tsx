import { Flight } from "@/Models/Flight";

const API_URL = 'http://127.0.0.1:8000'


export async function getFlights() {
    const response = await fetch(`${API_URL}/flights`)
    let apiResponse = await response.json()
    return apiResponse
}

export async function addFlight(flight: Flight) {
    const response = await await fetch(`${API_URL}/flights`, {
        method: 'POST',
        headers: {
            'Content-Type' : 'application/json'
        },
        body: JSON.stringify(flight)
    })
    return response.json()
}


export async function getBookedFlights() {
    const response = await fetch(`${API_URL}/booked-flights`)
    let apiResponse = await response.json()

    return apiResponse
}

