import FlightsDomain

class MockedFlightsRepository: FlightsRepository {
    private let cache = [
        Flight(id: "ahsdj2123", origin: Flight.Airport(name: "LON"), destination: Flight.Airport(name: "MDZ"), number: "123"),
        Flight(id: "hn22qu3yx", origin: Flight.Airport(name: "MDZ"), destination: Flight.Airport(name: "LON"), number: "5123")
    ]
    
    func getBy(id: String, callback: (Flight?) -> Void) {
        callback(cache.first(where: { $0.id == id }))
    }
    
    func getAll(callback: ([Flight]) -> Void) {
        callback(cache)
    }
}
