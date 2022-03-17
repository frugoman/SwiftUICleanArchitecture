import Combine
import FlightsDomain

public class FlightDetailViewModel: ObservableObject {
    @Published var origin: String = ""
    @Published var destination: String = ""
    @Published var number: String = ""
    @Published var errorMessage: String?
    
    public init() {}
    
    public func onFlightFetched(_ flight: Flight) {
        origin = flight.origin.name
        destination = flight.destination.name
        number = flight.number
    }
    
    public func on(flightNotFound id: String) {
        errorMessage = "Flight \(id) was not found"
    }
}
