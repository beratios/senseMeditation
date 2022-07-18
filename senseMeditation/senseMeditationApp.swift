//
//  senseMeditationApp.swift
//  senseMeditation
//
//  Created by Berat Gültekin on 1.07.2022.
//

import SwiftUI

@main
struct senseMeditationApp: App {
    @StateObject var AudioManager = audioManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AudioManager)
        }
    }
}
