import SwiftUI
import FlightsMVVMPresentation
import FlightsDomain

/// Composes the FlightDetailView with complex funtionality
struct FlightDetailViewAdapterMVVM: View {
    @Binding var flightId: String?
    
    var body: some View {
        if let flightId = flightId {
            DetailView(flightId: flightId)
        }
    }
    
    private func DetailView(flightId: String) -> some View {
        let vm = FlightDetailViewModel()
        let output = OutputComposer(flightFound: vm.onFlightFetched(_:), flightNotFound: vm.on(flightNotFound:))
        let useCase = GetFlightByIdUseCase(
            output: output,
            repository: MockedFlightsRepository()
        )
        return FlightDetailViewContainer(vm: vm)
            .onAppear { useCase.getFlight(byId: flightId) }
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
