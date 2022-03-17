import UIKit

public class UIKitFlightsListViewController: UITableViewController {
    private let onLoad: () -> Void
    private let onSelected: (String) -> Void
    
    private var flights: [FlightViewModel] = []
    
    public init(onLoad: @escaping () -> Void, onSelected: @escaping (String) -> Void) {
        self.onLoad = onLoad
        self.onSelected = onSelected
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

extension UIKitFlightsListViewController {
    public override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        flights.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "flightCell") else { return UITableViewCell() }
        cell.textLabel?.text = "\(flights[indexPath.row].origin) - \(flights[indexPath.row].destination)"
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onSelected(flights[indexPath.row].id)
    }
}

extension UIKitFlightsListViewController: FlightsListPresenterView {
    public func show(flights: [FlightViewModel]) {
        self.flights = flights
        tableView.reloadData()
    }
    
    public func showNoFlightsMessage(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [weak self] _ in self?.onLoad() }))
    }
}
