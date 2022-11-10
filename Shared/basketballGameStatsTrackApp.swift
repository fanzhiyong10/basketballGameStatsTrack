//
//  basketballGameStatsTrackApp.swift
//  Shared
//
//  Created by 范志勇 on 2022/11/11.
//

import SwiftUI

@main
struct basketballGameStatsTrackApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
