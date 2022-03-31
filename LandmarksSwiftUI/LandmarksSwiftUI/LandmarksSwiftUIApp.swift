//
//  LandmarksSwiftUIApp.swift
//  LandmarksSwiftUI
//
//  Created by Adem Deliaslan on 27.03.2022.
//

import SwiftUI

@main
struct LandmarksSwiftUIApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ModelData())
        }
#if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
#endif
#if os(watchOS)
        WKNotificationScene(controller: NotificationController.self,
                            category: "LandmarkNear")
#endif
        
        #if os(macOS)
        Settings {
            LandmarkSettings()
        }
        #endif
    }
}
