//
//  meditationViewModel.swift
//  senseMeditation
//
//  Created by Berat Gültekin on 2.07.2022.
//

import Foundation

final class meditationViewModel : ObservableObject {
    private(set) var meditation: Meditation
    
    init(meditation: Meditation) {
        self.meditation = meditation
    }
}



struct Meditation {
    
    let id = UUID()
    let title : String
    let description : String
    let duration : TimeInterval
    let track : String
    let image : String
    
    static let data = Meditation(title: "Relaxing Meditation", description: "Your time is limited, so don't waste it living someone else's life. Don't be trapped by dogma – which is living with the results of other people's thinking. -Steve Jobs", duration: 70, track: "meditation3", image: "meditation1")
//    static let data2 = Meditation(title: "Relaxing Meditation", description: "Your time is limited, so don't waste it living someone else's life. Don't be trapped by dogma – which is living with the results of other people's thinking. -Steve Jobs", duration: 70, track: "meditation3", image: "meditation1")
//    static let data3 = Meditation(title: "Relaxing Meditation", description: "Your time is limited, so don't waste it living someone else's life. Don't be trapped by dogma – which is living with the results of other people's thinking. -Steve Jobs", duration: 70, track: "meditation3", image: "meditation1")
//    static let dataArray = [data,data2,data3]
    
}
