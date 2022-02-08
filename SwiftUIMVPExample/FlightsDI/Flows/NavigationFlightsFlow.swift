import SwiftUI

/// This approach uses a push-like navigation to display the details screen
/// Composes the navigation functionality for push-like presentation
struct NavigationFlightsFlow: View {
    @State private var selection: String? = "list"
    @State private var selectedFlightId: String?
    
    var body: some View {
        NavigationView {
            HStack {
                FlightsListViewAdapter { fId in
                    selectedFlightId = fId
                    selection = "details"
                }
                NavigationLink(
                    destination: FlightDetailViewAdapter(flightId: $selectedFlightId)
                        .navigationTitle("Detail"),
                    tag: "details",
                    selection: $selection
                ) { EmptyView() }
            }
            .navigationTitle("List")
        }
    }
}

