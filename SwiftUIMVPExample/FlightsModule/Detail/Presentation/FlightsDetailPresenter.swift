import Foundation

protocol FlightDetailPresenterView {
    func show(flight: FlightDetailViewModel)
    func showFlightNotFound(message: String)
}

struct FlightDetailViewModel {
    let origin: String
    let destination: String
    let number: String
}

struct FlightsDetailPresenter {
    let view: FlightDetailPresenterView
    
    func onFlightFetched(_ flight: Flight) {
        view.show(flight: .with(flight: flight))
    }
    
    func on(flightNotFound id: String) {
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
