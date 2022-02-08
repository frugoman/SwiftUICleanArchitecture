struct GetFlightByIdUseCase {
    let output: (Flight) -> Void
    let onNotFound: (String) -> Void
    let repository: FlightsRepository
    
    func getFlight(byId id: String) {
        repository.getBy(id: id) {
            guard let flight = $0 else {
                onNotFound(id)
                return
            }
            output(flight)
        }
    }
}
