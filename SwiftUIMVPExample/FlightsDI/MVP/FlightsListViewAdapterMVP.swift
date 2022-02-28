import SwiftUI
import FlightsMVPPresentation
import FlightsDomain

/// Composes the FlightListView with complex funtionality
struct FlightsListViewAdapterMVP: View {
    var onFlightSelected: (String) -> Void
    @State private var flights = [FlightViewModel]()
    
    var body: some View {
        let flightsListView = FlightsListView(flights: $flights, onFlightSelected: onFlightSelected)
        let presenter = FlightsListPresenter(view: flightsListView)
        let onAppear = {
            GetAllFlightsUseCase(
                output: presenter.onFlightsFetched(_:),
                repository: MockedFlightsRepository()
            ).getAll()
        }
        return flightsListView
            .onAppear(perform: onAppear)
            .background(Color.red)
    }
}
