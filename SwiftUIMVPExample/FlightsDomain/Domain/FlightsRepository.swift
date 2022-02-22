protocol FlightsRepository {
    func getBy(id: String, callback: (Flight?) -> Void)
    
    func getAll(callback: ([Flight]) -> Void)
}
