import UIKit
import FlightsMVPPresentation
import FlightsDomain

class UIKitFlightsListFactoryMVP {
    var onSelected: ((String) -> Void)?
    let tracker: Analytics
    let repository: FlightsRepository
    
    init(tracker: Analytics, repository: FlightsRepository) {
        self.tracker = tracker
        self.repository = repository
    }
    
    func listViewController() -> UIViewController {
        let presenter = FlightsListPresenter()
        let useCase = GetAllFlightsUseCase(
            output: { flights in
                presenter.onFlightsFetched(flights)
                self.tracker.track("Flights Fetched")
            },
            repository: repository
        )
        let vc = UIKitFlightsListViewController {
            useCase.getAll()
            self.tracker.track("View Loaded")
        } onSelected: { flightId in
            self.tracker.track("flight selected")
            self.onSelected?(flightId)
        }
        presenter.view = vc
        return vc
    }
}
