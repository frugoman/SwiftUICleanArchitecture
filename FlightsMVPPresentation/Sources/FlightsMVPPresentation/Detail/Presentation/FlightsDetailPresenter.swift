import FlightsDomain

public protocol FlightDetailPresenterView {
    func show(flight: FlightDetailViewModel)
    func showFlightNotFound(message: String)
}

public struct FlightDetailViewModel {
    let origin: String
    let destination: String
    let number: String
}

public struct FlightsDetailPresenter {
    let view: FlightDetailPresenterView
    
    public init(view: FlightDetailPresenterView) {
        self.view = view
    }
    
    public func onFlightFetched(_ flight: Flight) {
        view.show(flight: .with(flight: flight))
    }
    
    public func on(flightNotFound id: String) {
        view.showFlightNotFound(message: "Flight \(id) was not found")
    }
}

private extension FlightDetailViewModel {
    static func with(flight: Flight) -> FlightDetailViewModel {
        FlightDetailViewModel(
            origin: flight.origin.name,
            destination: flight.destination.name,
            number: flight.number
        )
    }
}
