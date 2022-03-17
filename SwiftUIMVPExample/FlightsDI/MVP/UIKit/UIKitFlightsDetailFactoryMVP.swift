import UIKit
import FlightsMVPPresentation
import FlightsDomain

class UIKitFlightsDetailFactoryMVP {
    let tracker: Analytics
    let repository: FlightsRepository
    
    init(tracker: Analytics, repository: FlightsRepository) {
        self.tracker = tracker
        self.repository = repository
    }
    
    
    func detailsViewController(forFlightId id: String) -> UIViewController {
        let presenter = FlightsDetailPresenter()
        let useCase = GetFlightByIdUseCase(
            output: UseCaseOutputAdapter(presenter: presenter, tracker: tracker),
            repository: repository
        )
        let vc = FlightsDetailViewController()
        vc.onLoad = {
            useCase.getFlight(byId: id)
            self.tracker.track("View Loaded")
        }
        presenter.view = vc
        return vc
    }
    
    private struct UseCaseOutputAdapter: GetFlightByIdUseCaseOutput {
        let presenter: FlightsDetailPresenter
        let tracker: Analytics
        
        func onFlightFound(_ flight: FlightsDomain.Flight) {
            presenter.onFlightFetched(flight)
            tracker.track("Flight Fetched")
        }
        
        func onFlightNotFound(_ flightId: String) {
            tracker.track("Flight not found")
            presenter.on(flightNotFound: flightId)
        }
    }
}

public class FlightsDetailViewController: UIViewController, FlightDetailPresenterView {
    var onLoad: (() -> Void)?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        onLoad?()
    }
    
    public func show(flight: FlightDetailViewModel) {
        // show
    }
    
    public func showFlightNotFound(message: String) {
        // show
    }
}

private struct Flight {}
