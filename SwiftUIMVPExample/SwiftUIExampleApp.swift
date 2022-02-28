//
//  SwiftUIMVPExampleApp.swift
//  SwiftUIMVPExample
//
//  Created by Nicolas Frugoni on 08/02/2022.
//

import SwiftUI

@main
struct SwiftUIExampleApp: App {
    var body: some Scene {
        WindowGroup {
//            NavigationFlightsFlow()
            // Swap between the 2 to see the different approaches
            ModalFlightsFlow()
        }
    }
}
