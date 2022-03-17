public protocol FlightsRepository {
    func getBy(id: String, callback: @escaping (Flight?) -> Void)
    
    func getAll(callback: @escaping ([Flight]) -> Void)
}
