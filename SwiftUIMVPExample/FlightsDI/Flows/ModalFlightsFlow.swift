import SwiftUI

/// This approach uses a sheet to display the details screen
/// Composes the navigation functionality for modal presentation
struct ModalFlightsFlow: View {
    @State private var showDetail = false
    @State private var selectedFlightId: String?
    
    var body: some View {
        FlightsListViewAdapter { fId in
            selectedFlightId = fId
            showDetail = true
        }
        .sheet(isPresented: $showDetail) {
            FlightDetailViewAdapter(flightId: $selectedFlightId)
        }
    }
}
