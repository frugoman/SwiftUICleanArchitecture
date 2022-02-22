import SwiftUI
import FlightsMVPPresentation

/// Composes the FlightDetailView with complex funtionality
struct FlightDetailViewAdapter: View {
    @Binding var flightId: String?
//    @State var flight: FlightDetailViewModel?
    
    var body: some View {
        DetailView(flightId: flightId)
    }
    
    private func DetailView(flightId: String?) -> some View {
        guard let flightId = flightId else {
            return AnyView(EmptyView())
        }
        let detailView = FlightDetailView()
        let presenter = FlightsDetailPresenter(view: detailView)
        let useCase = GetFlightByIdUseCase(
            output: presenter.onFlightFetched(_:),
            onNotFound: presenter.on(flightNotFound:),
            repository: MockedFlightsRepository()
        )
        let onAppear = { useCase.getFlight(byId: flightId) }
        return AnyView(detailView.onAppear(perform: onAppear))
    }
}
