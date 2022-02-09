struct GetAllFlightsUseCase {
    let output: ([Flight]) -> Void
    let repository: FlightsRepository
    
    func getAll() {
        /// Implement business logic here, like sorting, filtering, etc
        repository.getAll(callback: output)
    }
}
