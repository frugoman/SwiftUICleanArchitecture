import SwiftUI

/// Composes the FlightDetailView with complex funtionality
struct FlightDetailViewAdapter: View {
    @Binding var flightId: String?
    @State var flight: FlightDetailViewModel?
    
    var body: some View {
        detailView(flightId: flightId)
    }
    
    private func detailView(flightId: String?) -> some View {
        guard let flightId = flightId else {
            return AnyView(EmptyView())
        }
        let detailView = FlightDetailView(flight: $flight)
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
