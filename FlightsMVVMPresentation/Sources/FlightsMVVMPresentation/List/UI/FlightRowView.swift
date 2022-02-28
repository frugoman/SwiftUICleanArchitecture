//
//  FlightRowView.swift
//  SwiftUIMVPExample
//
//  Created by Nicolas Frugoni on 08/02/2022.
//

import SwiftUI

public struct FlightRowView: View {
    var vm: FlightListItemViewModel
    
    public init(vm: FlightListItemViewModel) {
        self.vm = vm
    }
    
    public var body: some View {
        HStack {
            VStack{
                Text("From")
                Text(vm.origin)
            }
            Spacer()
            VStack{
                Text("From")
                Text(vm.destination)
            }
        }
        .padding()
    }
}

import FlightsDomain

struct FlightRowView_Previews: PreviewProvider {
    static var previews: some View {
        FlightRowView(vm: FlightListItemViewModel(flight: Flight(id: "13", origin: Flight.Airport(name: "MDZ"), destination: Flight.Airport(name: "HFA"), number: "51"), onSelected: { }))
    }
}
