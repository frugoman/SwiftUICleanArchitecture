import SwiftUI
import FlightsMVVMPresentation
import FlightsDomain

/// Composes the FlightListView with complex funtionality
struct FlightsListViewAdapterMVVM: View {
    var onFlightSelected: (String) -> Void
    
    var body: some View {
        let vm = FlightsListViewModel { onFlightSelected($0.id) }
        return FlightsListView(vm: vm)
            .onAppear {
                GetAllFlightsUseCase(
                    output: vm.onFlightsFetched(_:),
                    repository: MockedFlightsRepository()
                ).getAll()
            }
    }
}
