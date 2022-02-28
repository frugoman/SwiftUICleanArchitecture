public struct Flight {
    public let id: String
    public let origin: Airport
    public let destination: Airport
    public let number: String
    
    public struct Airport {
        public let name: String
        
        public init(name: String) {
            self.name = name
        }
    }
    
    public init(id: String, origin: Airport, destination: Airport, number: String) {
        self.id = id
        self.origin = origin
        self.destination = destination
        self.number = number
    }

}
