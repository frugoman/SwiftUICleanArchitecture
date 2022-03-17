//
//  ContentView.swift
//  SwiftUIMVPExample
//
//  Created by Nicolas Frugoni on 08/02/2022.
//

import SwiftUI

public struct FlightsListView: View {
    @Binding var flights: [FlightViewModel]
    @State var errorMessage: String?
    let onFlightSelected: (String) -> Void
    
    public init(flights: Binding<[FlightViewModel]>, onFlightSelected: @escaping (String) -> Void) {
        self.onFlightSelected = onFlightSelected
        _flights = flights
    }
    
    public var body: some View {
        HStack {
            if let error = errorMessage {
                Text(error)
            } else {
                List(flights) { flight in
                    FlightRowView(flight: flight)
                        .onTapGesture {
                            onFlightSelected(flight.id)
                        }
                }
            }
        }
    }
}

extension FlightsListView: FlightsListPresenterView {
    public func show(flights: [FlightViewModel]) {
        self.flights = flights
    }
    
    public func showNoFlightsMessage(_ message: String) {
        errorMessage = message
    }
}

struct FlightsListView_Previews: PreviewProvider {
    static var previews: some View {
        FlightsListView(flights: .constant([FlightViewModel(id: "", origin: "ASD", destination: "GSF", number: "123")]) ,onFlightSelected: { _ in })
    }
}
