import FlightsDomain
import Combine

public class FlightsListViewModel: ObservableObject {
    @Published var title: String = "Flights"
    @Published var flights: [FlightListItemViewModel] = []
    @Published var errorMessage: String?
    let onSelected: (Flight) -> Void
    
    public init(onSelected: @escaping (Flight) -> Void) {
        self.onSelected = onSelected
    }
    
    public func onFlightsFetched(_ flights: [Flight]) {
        guard flights.count > 0 else {
            errorMessage = "No available flights at the moment"
            return
        }
        self.flights = flights.map { flight in
            FlightListItemViewModel(flight: flight) { [weak self] in
                self?.onSelected(flight)
            }}
    }
}
