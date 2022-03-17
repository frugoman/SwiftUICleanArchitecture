import SwiftUI

public struct FlightDetailView: View {
    @Binding var flight: FlightDetailViewModel?
    @State var errorMessage: String? = nil
    
    public init(flight: Binding<FlightDetailViewModel?>) {
        _flight = flight
    }
    
    public var body: some View {
        if let flight = flight {
            FlightDetail(flight)
        } else if let message = errorMessage {
            Text(message)
        } else {
            Text("Loading...")
        }
    }
}

private func FlightDetail(_ flight: FlightDetailViewModel) -> some View {
    VStack {
        Text("Flight No. \(flight.number)")
            .font(.title2)
        Spacer()
            .frame(width: 0, height: 40)
        HStack(spacing: 16) {
            VStack(spacing: 4) {
                Text("From")
                AirportNameView(name: flight.origin)
            }
            Spacer()
            Image(systemName: "arrow.right")
            Spacer()
            VStack(spacing: 4) {
                Text("From")
                AirportNameView(name: flight.destination)
            }
        }.padding()
    }
}

extension FlightDetailView: FlightDetailPresenterView {
    public func show(flight: FlightDetailViewModel) {
        self.flight = flight
    }
    
    public func showFlightNotFound(message: String) {
        errorMessage = message
    }
}

struct FlightDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FlightDetail(FlightDetailViewModel(origin: "MDZ", destination: "LDC", number: "1315"))
    }
}
