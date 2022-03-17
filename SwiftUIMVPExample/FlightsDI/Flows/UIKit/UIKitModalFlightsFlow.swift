//
//  UIKitModalFlightsFlow.swift
//  SwiftUIMVPExample
//
//  Created by Nicolas Frugoni on 04/03/2022.
//

import UIKit

class UIKitModalFlightsFlow {
    func start() -> UIViewController {
        let tracker = GoogleAnalyticsAdapter()
        let repository = MockedFlightsRepository()
        let listFactory = UIKitFlightsListFactoryMVP(tracker: tracker, repository: repository)
        let listController = listFactory.listViewController()
        listFactory.onSelected = { flightId in
            let detailsController = UIKitFlightsDetailFactoryMVP(tracker: tracker, repository: repository).detailsViewController(forFlightId: flightId)
            listController.present(detailsController, animated: true, completion: nil)
        }
        return listController
    }
}
