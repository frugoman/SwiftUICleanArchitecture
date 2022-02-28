import SwiftUI

public struct FlightDetailViewContainer: View {
    @ObservedObject var vm: FlightDetailViewModel
    
    public init(vm: FlightDetailViewModel) {
        self.vm = vm
    }
    
    public var body: some View {
        if let error = vm.errorMessage {
            Text(error)
        } else {
            FlightDetailView(origin: vm.origin, destination: vm.destination, number: vm.number)
        }
    }
}

struct FlightDetailView: View {
    var origin: String = ""
    var destination: String = ""
    var number: String = ""

    public var body: some View {
        VStack {
            Text("Flight No. \(number)")
                .font(.title2)
            Spacer()
                .frame(width: 0, height: 40)
            HStack(spacing: 16) {
                VStack(spacing: 4) {
                    Text("From")
                    Text(origin)
                }
                Spacer()
                Image(systemName: "arrow.right")
                Spacer()
                VStack(spacing: 4) {
                    Text("From")
                    Text(destination)
                }
            }.padding()
        }
    }
}

struct FlightDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FlightDetailView(origin: "132", destination: "asd", number: "45")
    }
}
