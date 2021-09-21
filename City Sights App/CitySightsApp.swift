//
//  CitySightsApp.swift
//  City Sights App
//
//  Created by Colton Shoenberger on 9/20/21.
//

import SwiftUI

@main
struct CitySightsApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
