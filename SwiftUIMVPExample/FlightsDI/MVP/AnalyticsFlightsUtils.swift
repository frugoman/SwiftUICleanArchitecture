//
//  AnalyticsFlightsRepositoryDecorator.swift
//  SwiftUIMVPExample
//
//  Created by Nicolas Frugoni on 04/03/2022.
//

import FlightsDomain

protocol Analytics {
    func track(_ event: String)
}

class GoogleAnalyticsAdapter: Analytics {
    func track(_ event: String) {
       // track on google analytics..
   }
}

struct AnalyticsFlightsRepositoryDecorator: FlightsRepository {
    let decoratee: FlightsRepository
    let tracker: Analytics
    
    func getAll(callback: @escaping ([Flight]) -> Void) {
        decoratee.getAll { flights in
            tracker.track("Flights returned")
            callback(flights)
        }
    }
    
    func getBy(id: String, callback: @escaping (Flight?) -> Void) {
        decoratee.getBy(id: id) { flight in
            if flight == nil {
                tracker.track("No flight found for id \(id)")
            } else {
                tracker.track("flight found")
            }
            callback(flight)
        }
    }
}
