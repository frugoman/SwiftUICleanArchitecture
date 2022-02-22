import Foundation

struct Flight {
    let id: String
    let origin: Airport
    let destination: Airport
    let number: String
    
    struct Airport {
        let name: String
    }
}
