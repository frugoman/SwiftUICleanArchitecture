//
//  FlightRowView.swift
//  SwiftUIMVPExample
//
//  Created by Nicolas Frugoni on 08/02/2022.
//

import SwiftUI

struct FlightRowView: View {
    var flight: FlightViewModel
    
    var body: some View {
        HStack {
            VStack{
                Text("From")
                AirportNameView(name: flight.origin)
            }
            Spacer()
            VStack {
                Text("Number")
                Text(flight.number)
            }
            Spacer()
            VStack{
                Text("From")
                AirportNameView(name: flight.destination)
            }
        }
        .padding()
    }
}

struct FlightRowView_Previews: PreviewProvider {
    static var previews: some View {
        FlightRowView(flight: FlightViewModel(id: "", origin: "BRC", destination: "LON", number: "123"))
    }
}
