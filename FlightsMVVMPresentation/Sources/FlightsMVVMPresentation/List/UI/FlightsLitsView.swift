//
//  ContentView.swift
//  SwiftUIMVPExample
//
//  Created by Nicolas Frugoni on 08/02/2022.
//

import SwiftUI
import FlightsDomain

public struct FlightsListView: View {
    @ObservedObject var vm: FlightsListViewModel
    
    public init(vm: FlightsListViewModel) {
        self.vm = vm
    }
    
    public var body: some View {
        List(vm.flights, id: \.origin) { flight in
            FlightRowView(vm: flight)
                .onTapGesture(perform: flight.onSelected)
        }
    }
}

struct FlightsListView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = FlightsListViewModel(onSelected: { _ in})
        vm.onFlightsFetched([Flight(id: "1", origin: Flight.Airport(name: "MDZ"), destination: Flight.Airport(name: "LDC"), number: "2312")])
        return FlightsListView(vm: vm)
    }
}
