 //
//  playControlButton.swift
//  senseMeditation
//
//  Created by Berat Gültekin on 2.07.2022.
//

import SwiftUI

struct playControlButton: View {
    var systemName : String = "play"
    var fontSize : CGFloat = 24
    var color : Color = .white
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemName)
                .font(.system(size: fontSize))
                .foregroundColor(color)
        }

    }
}

struct playControlButton_Previews: PreviewProvider {
    static var previews: some View {
        playControlButton(action: {})
            .preferredColorScheme(.dark)
    }
}
