import SwiftUI
import FlightsMVPPresentation
import FlightsDomain

/// Composes the FlightDetailView with complex funtionality
struct FlightDetailViewAdapterMVP: View {
    @Binding var flightId: String?
    @State var flight: FlightDetailViewModel?
    
    var body: some View {
        DetailView(flightId: flightId)
    }
    
    private func DetailView(flightId: String?) -> some View {
        guard let flightId = flightId else {
            return AnyView(EmptyView())
        }
        let detailView = FlightDetailView(flight: $flight)
        let presenter = FlightsDetailPresenter(view: detailView)
        let output = OutputComposer(flightFound: presenter.onFlightFetched(_:), flightNotFound: presenter.on(flightNotFound:))
        let useCase = GetFlightByIdUseCase(
            output: output,
            repository: MockedFlightsRepository()
        )
        let onAppear = { useCase.getFlight(byId: flightId) }
        return AnyView(detailView.onAppear(perform: onAppear))
    }
}

private struct OutputComposer: GetFlightByIdUseCaseOutput {
    let flightFound:(_ flight: Flight) -> Void
    let flightNotFound:(_ flightId: String) -> Void
    
    func onFlightFound(_ flight: Flight) {
        flightFound(flight)
    }
    
    func onFlightNotFound(_ flightId: String) {
        flightNotFound(flightId)
    }
}
