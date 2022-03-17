import UIKit

public class UIKitFlightsDetailViewController: UIViewController {
    private let onLoad: () -> Void
    
    public init(onLoad: @escaping () -> Void) {
        self.onLoad = onLoad
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        onLoad()
    }
}

extension UIKitFlightsDetailViewController: FlightDetailPresenterView {
    public func showFlightNotFound(message: String) {
        // Show error
    }
    
    public func show(flight: FlightDetailViewModel) {
        // Update the UI
    }
}
