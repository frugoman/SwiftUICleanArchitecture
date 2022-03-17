import FlightsDomain
import Foundation

class MockedFlightsRepository: FlightsRepository {
    private let cache = [
        Flight(id: "ahsdj2123", origin: Flight.Airport(name: "LON"), destination: Flight.Airport(name: "MDZ"), number: "123"),
        Flight(id: "hn22qu3yx", origin: Flight.Airport(name: "MDZ"), destination: Flight.Airport(name: "LON"), number: "5123")
    ]
    
    func getBy(id: String, callback: @escaping (Flight?) -> Void) {
        callback(cache.first(where: { $0.id == id }))
    }
    
    func getAll(callback: @escaping ([Flight]) -> Void) {
        callback(cache)
    }
}

class URLSessionAdapter: APISession {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: request, completionHandler: completionHandler)
    }
}
struct CustomHeadersApiSessionDecorator: APISession {
    let decoratee: APISession
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        var newRequest = request
        newRequest.addValue("value", forHTTPHeaderField: "header-name")
        decoratee.dataTask(with: newRequest, completionHandler: completionHandler)
    }
}

protocol APISession {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

class APIFlightsRepository: FlightsRepository {
    private let session: APISession
    
    init(session: APISession) {
        self.session = session
    }
    
    func getBy(id: String, callback: @escaping (Flight?) -> Void) {
        session.dataTask(with: URLRequest(url: URL(string:"")!)) { data, response, error in
            //map response
            let mappedResponse = Flight(id: "123", origin: Flight.Airport(name: "LDN"), destination: Flight.Airport(name: "USA"), number: "12315")
            callback(mappedResponse)
        }
    }
    
    func getAll(callback: @escaping ([Flight]) -> Void) {
        session.dataTask(with: URLRequest(url: URL(string:"")!)) { data, response, error in
            //map response
            let mappedResponse = [
                Flight(id: "123", origin: Flight.Airport(name: "LDN"), destination: Flight.Airport(name: "USA"), number: "12315")
            ]
            callback(mappedResponse)
        }
    }
}
