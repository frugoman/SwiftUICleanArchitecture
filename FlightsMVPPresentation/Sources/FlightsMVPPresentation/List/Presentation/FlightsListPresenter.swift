import FlightsDomain

public protocol FlightsListPresenterView {
    func show(flights: [FlightViewModel])
    func showNoFlightsMessage(_ message: String)
}

public struct FlightViewModel: Identifiable {
    public var id: String
    let origin: String
    let destination: String
    let number: String
}

public class FlightsListPresenter {
    public var view: FlightsListPresenterView?
    public init() {}
    
    public func onFlightsFetched(_ flights: [Flight]) {
        guard flights.count > 0 else {
            view?.showNoFlightsMessage("No available flights at the moment")
            return
        }
        view?.show(flights: flights.map(FlightViewModel.with(flight:)))
    }
}

private extension FlightViewModel {
    static func with(flight: Flight) -> FlightViewModel {
        FlightViewModel(id: flight.id, origin: flight.origin.name, destination: flight.destination.name, number: flight.number)
    }
}
