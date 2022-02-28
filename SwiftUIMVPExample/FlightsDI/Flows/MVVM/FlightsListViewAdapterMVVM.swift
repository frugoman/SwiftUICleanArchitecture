import SwiftUI
import FlightsMVVMPresentation
import FlightsDomain

/// Composes the FlightListView with complex funtionality
struct FlightsListViewAdapterMVVM: View {
    var onFlightSelected: (String) -> Void
//    @State private var flights = [FlightViewModel]()
    
    var body: some View {
        let vm = FlightsListViewModel { onFlightSelected($0.id) }
        let view = FlightsListView(vm: vm)
    
        let onAppear = {
            GetAllFlightsUseCase(
                output: vm.onFlightsFetched(_:),
                repository: MockedFlightsRepository()
            ).getAll()
        }
        return view
            .onAppear(perform: onAppear)
            .background(Color.red)
    }
}
