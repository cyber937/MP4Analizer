//
//  MP4AnalizerApp.swift
//  MP4Analizer
//
//  Created by Kiyoshi Nagahama on 7/8/24.
//

import SwiftUI

@main
struct MP4AnalizerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            MP4AnalizerCommands()
        }
    }
}
