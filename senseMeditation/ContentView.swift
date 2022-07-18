//
//  ContentView.swift
//  senseMeditation
//
//  Created by Berat Gültekin on 1.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        meditationChoosePage(meditationVM: meditationViewModel(meditation: Meditation.data))
        musicListPage(meditationVM: meditationViewModel(meditation: Meditation.data))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
//            .environmentObject(audioManager())
        musicListPage(meditationVM: meditationViewModel(meditation: Meditation.data))
            .environmentObject(audioManager())
    }
}
