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
    
    // 全局环境变量 1.必须确保生成
    @StateObject var plusMinus = MainStateControl()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(plusMinus)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
