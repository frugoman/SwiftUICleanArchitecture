import SwiftUI
import FlightsMVVMPresentation
import FlightsDomain

/// Composes the FlightDetailView with complex funtionality
struct FlightDetailViewAdapterMVVM: View {
    @Binding var flightId: String?
    
    var body: some View {
        guard let flightId = flightId else {
            return AnyView(EmptyView())
        }
        let vm = FlightDetailViewModel()
        let view = FlightDetailViewContainer(vm: vm)
        let output = OutputComposer(flightFound: vm.onFlightFetched(_:), flightNotFound: vm.on(flightNotFound:))
        let useCase = GetFlightByIdUseCase(
            output: output,
            repository: MockedFlightsRepository()
        )
        let onAppear = { useCase.getFlight(byId: flightId) }
        return AnyView(view.onAppear(perform: onAppear))
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
