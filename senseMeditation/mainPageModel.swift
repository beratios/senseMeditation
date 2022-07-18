//
//  mainPageModel.swift
//  senseMeditation
//
//  Created by Berat Gültekin on 7.07.2022.
//

import Foundation
import SwiftUI

struct mainPageModel: Identifiable {
    
    var id = UUID()
    var title : String
    var description : String
    var image : String
  
    
}

var mainpage1 = mainPageModel(title: "Meditation1", description: "Choose Your Meditation", image: "soft")
var mainpage2 = mainPageModel(title: "Meditation2", description: "Relaxing Meditation2", image: "soft")
var mainpage3 = mainPageModel(title: "Meditation3", description: "Relaxing Meditation3", image: "soft")

var mainPageArray = [mainpage1,mainpage2,mainpage3]


