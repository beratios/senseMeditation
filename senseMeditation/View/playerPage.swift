//
//  playerPage.swift
//  senseMeditation
//
//  Created by Berat Gültekin on 1.07.2022.
//

import SwiftUI

struct playerPage: View {
    @EnvironmentObject var AudioManager: audioManager
    var meditationVM: meditationViewModel
    var isPreview: Bool = false
    @State private var value : Double = 0.0
    @State private var isEditing: Bool = false
    @Environment(\.dismiss) var dismiss
    
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            //Background Image
            Image(meditationVM.meditation.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            //Blur View
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()
            VStack(spacing:32) {
                //DismissButton
                HStack {
                    Button {
                    //
                        AudioManager.stop()
                        dismiss()
                } label: {
                    //close button 
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 36))
                        .foregroundColor(.white)
                }
                    Spacer()

            }
                //Title
                Text(meditationVM.meditation.title)
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                if let player = AudioManager.player {
                    
                
                    VStack(spacing: 5) {
                        Slider(value: $value, in: 0...player.duration) {
                            editing in
                            print("editing", editing)
                            isEditing = editing
                            if !editing {
                                player.currentTime = value
                            }
                        }
                        .accentColor(.white)
                    
                    HStack {
                        Text(DateComponentsFormatter.positional.string(from: player.currentTime) ?? "0:00")
                             Spacer()
                        Text(DateComponentsFormatter.positional.string(from: player.duration - player.currentTime) ?? "0:00")
                    } .font(.caption)
                        .foregroundColor(.white)
                    
                }
                
                
                HStack {
                    //repeat button
                    let color: Color = AudioManager.isLooping ? .teal : .white
                    playControlButton(systemName: "repeat", color: color) {
                        
                        AudioManager.toggleLoop()
                        
                    }
                    Spacer()
                    //backward butrton
                    
                    playControlButton(systemName: "gobackward.10") {
                        player.currentTime -= 10
                        
                    }
                    Spacer()
                    //play/pause button
                    playControlButton(systemName: AudioManager.isPlaying ? "pause.circle.fill" : "play.circle.fill", fontSize: 44) {
                        AudioManager.playPause()
                        
                    }
                    Spacer()
                    playControlButton(systemName: "goforward.10") {
                        player.currentTime += 10
                        
                    }
                    Spacer()
                    playControlButton(systemName: "stop.fill") {
                        AudioManager.stop()
                        dismiss()
                        
                    }
                }
                }
                
                
            }
            .padding(15)
            
            
            
            
            
            
        }
        .onAppear {
//            audioManager.shared.startPlayer(track: meditationVM.meditation.track, isPreview: isPreview)
            AudioManager.startPlayer(track: meditationVM.meditation.track, isPreview: isPreview)
    }
        .onReceive(timer) { _ in
            guard let player = AudioManager.player, !isEditing else { return }
            value = player.currentTime
        }
    }
}

struct playerPage_Previews: PreviewProvider {
    static let meditationVM = meditationViewModel(meditation: Meditation.data)
    static var previews: some View {
        
            
//            playerPage(meditationVM: meditationVM).previewDevice("iPhone 11 Pro")
//            playerPage(meditationVM: meditationVM).previewDevice("iPhone 11")
//            playerPage(meditationVM: meditationVM).previewDevice("iPhone 8")
//            playerPage(meditationVM: meditationVM).previewDevice("iPhone SE (2nd generation)")
        
        playerPage(meditationVM: meditationVM, isPreview:true)
            .environmentObject(audioManager())
    }
}
