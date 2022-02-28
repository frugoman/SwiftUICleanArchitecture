import Combine
import FlightsDomain

public class FlightListItemViewModel: ObservableObject {
    @Published var origin: String = ""
    @Published var destination: String = ""
    let onSelected: () -> Void
    
    public init(flight: Flight, onSelected: @escaping () -> Void) {
        self.onSelected = onSelected
        origin = flight.origin.name
        destination = flight.destination.name
    }
}
