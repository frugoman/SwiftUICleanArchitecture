import SwiftUI

struct AirportNameView: View {
    let name: String
    
    var body: some View {
        Text(name)
            .font(.system(size: 32).bold())
    }
}
