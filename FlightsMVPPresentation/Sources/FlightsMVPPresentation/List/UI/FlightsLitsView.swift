//
//  ContentView.swift
//  SwiftUIMVPExample
//
//  Created by Nicolas Frugoni on 08/02/2022.
//

import SwiftUI

struct FlightsListView: View {
    @Binding var flights: [FlightViewModel]
    @State var errorMessage: String?
    let onFlightSelected: (String) -> Void
    
    var body: some View {
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
    func show(flights: [FlightViewModel]) {
        self.flights = flights
    }
    
    func showNoFlightsMessage(_ message: String) {
        errorMessage = message
    }
}

struct FlightsListView_Previews: PreviewProvider {
    static var previews: some View {
        FlightsListView(flights: .constant([
            FlightViewModel(id: "1", origin: "ASD", destination: "CZX", number: "52"),
            FlightViewModel(id: "4", origin: "GSC", destination: "ARS", number: "73")
        ]), onFlightSelected: { _ in })
        FlightsListView(flights: .constant([]), errorMessage: "No flights, sorry!", onFlightSelected: { _ in })
    }
}
