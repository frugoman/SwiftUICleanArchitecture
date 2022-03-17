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
            // We can A/B Test to switch to different implementations of the feature
//            NavigationFlightsFlow()
             ModalFlightsFlow()
            // UIKitModalFlightsFlow().start()
        }
    }
}
