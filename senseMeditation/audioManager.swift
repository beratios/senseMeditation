//
//  audioManager.swift
//  senseMeditation
//
//  Created by Berat Gültekin on 4.07.2022.
//

import Foundation
import AVKit


final class audioManager: ObservableObject {
//    static let shared = audioManager()
    var player: AVAudioPlayer?
    @Published private(set) var isPlaying: Bool = false {
        didSet {
            print("isPlaying", isPlaying)
        }
    }
    @Published private(set) var isLooping: Bool = false
    
    func startPlayer(track:String, isPreview:Bool = false) {
        guard let url = Bundle.main.url(forResource: track, withExtension: "mp3") else {
            print("Not found: \(track)")
            return
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback,mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url)
            if isPreview {
                player?.prepareToPlay()
            } else {
                player?.play()
                isPlaying = true
            }
            player?.play()
        } catch {
            print("Fail to initialize player", error)
        }
    }
    func playPause() {
        guard let player = player else {
            print("Instance of audio player not found")
            return
        }
        if player.isPlaying {
            player.pause()
            isPlaying = false
        } else {
            player.play()
            isPlaying = true 
        }
    }
    func stop() {
        guard let player = player else{ return }
        if player.isPlaying {
            player.stop()
            isPlaying = false
        }
    }
    func toggleLoop() {
        guard let player = player else { return }
        
        player.numberOfLoops = player.numberOfLoops == 0 ? -1 : 0
        isLooping = player.numberOfLoops != 0
        print("isLooping", isLooping)
    }
}
