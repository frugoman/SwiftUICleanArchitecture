import SwiftUI

public struct FlightDetailView: View {
    @Binding var flight: FlightDetailViewModel?
    @State var errorMessage: String?
    
    public init() {}
    
    var body: some View {
        if let flight = flight {
            Flight(flight)
        } else if let message = errorMessage {
            Text(message)
        } else {
            Text("Loading...")
        }
    }
    
    private func Flight(_ flight: FlightDetailViewModel) -> some View {
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
}

extension FlightDetailView: FlightDetailPresenterView {
    func show(flight: FlightDetailViewModel) {
        self.flight = flight
    }
    
    func showFlightNotFound(message: String) {
        errorMessage = message
    }
}

struct FlightDetailView_Previews: PreviewProvider {
    static var group: some View {
        Group {
            FlightDetailView(flight: .constant(FlightDetailViewModel(origin: "132", destination: "asd", number: "45")))
            FlightDetailView(flight: .constant(nil))
            FlightDetailView(flight: .constant(nil), errorMessage: "Flight Not Found!")
        }.previewLayout(.sizeThatFits)
    }
    
    static var previews: some View {
        group
        group.preferredColorScheme(.dark)
    }
}
