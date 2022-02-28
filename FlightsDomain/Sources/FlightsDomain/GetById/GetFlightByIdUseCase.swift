public protocol GetFlightByIdUseCaseOutput {
    func onFlightNotFound(_ flightId: String)
    func onFlightFound(_ flight: Flight)
}

public struct GetFlightByIdUseCase {
    let output: GetFlightByIdUseCaseOutput
    let repository: FlightsRepository
    
    public init(output: GetFlightByIdUseCaseOutput, repository: FlightsRepository) {
        self.output = output
        self.repository = repository
    }
    
    public func getFlight(byId id: String) {
        repository.getBy(id: id) {
            guard let flight = $0 else {
                output.onFlightNotFound(id)
                return
            }
            output.onFlightFound(flight)
        }
    }
}
