public struct GetAllFlightsUseCase {
    let output: ([Flight]) -> Void
    let repository: FlightsRepository
    
    public init(output: @escaping ([Flight]) -> Void, repository: FlightsRepository) {
        self.output = output
        self.repository = repository
    }
    
    public func getAll() {
        /// Implement business logic here, like sorting, filtering, etc
        repository.getAll(callback: output)
    }
}
