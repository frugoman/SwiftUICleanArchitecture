import SwiftUI
import FlightsMVPPresentation
import FlightsDomain

/// Composes the FlightListView with complex funtionality
struct FlightsListViewAdapterMVP: View {
    var onFlightSelected: (String) -> Void
    @State private var flights = [FlightViewModel]()
    
    var body: some View {
        let flightsListView = FlightsListView(flights: $flights, onFlightSelected: onFlightSelected)
        let presenter = FlightsListPresenter()
        presenter.view = flightsListView
        let tracker = GoogleAnalyticsAdapter()
        let flightsLogger = FlightsListLogger(tracker: tracker)
        let useCase = GetAllFlightsUseCase(
            output: { flights in
                presenter.onFlightsFetched(flights)
                flightsLogger.flightsFetched()
            },
            repository: AnalyticsFlightsRepositoryDecorator(
                decoratee: MockedFlightsRepository(),
                tracker: tracker
            )
        )
        let onAppear = {
            useCase.getAll()
            flightsLogger.onLoad()
        }
        return flightsListView
            .onAppear(perform: onAppear)
            .background(Color.red)
    }
    
    struct FlightsListLogger {
        let tracker: Analytics
        
        func onLoad() {
            tracker.track("Screen loaded")
        }
        
        func flightsFetched() {
            tracker.track("Flights were fetched")
        }
    }
}
