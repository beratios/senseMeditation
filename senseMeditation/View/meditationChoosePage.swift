//
//  meditationChoosePage.swift
//  senseMeditation
//
//  Created by Berat Gültekin on 1.07.2022.
//

import SwiftUI

struct meditationChoosePage: View {
    var meditationVM: meditationViewModel
    @State private var showPlayer = false
    var body: some View {
        VStack{
            
//         ZStack {
            Image(meditationVM.meditation.image)
                .resizable()
//                .aspectRatio(contentMode: .fill)
                .scaledToFill()
                .ignoresSafeArea()
                .frame(height: UIScreen.main.bounds.height / 3)
                
            
            VStack {
                
                VStack(spacing: 8) {
                    Text("MUSIC")
                        .foregroundColor(Color.white)
                    Text(DateComponentsFormatter.abbreviated.string(from: meditationVM.meditation.duration) ??
                        meditationVM.meditation.duration.formatted() + "S")
                        .foregroundColor(Color.white)
                }.frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
                    .opacity(0.7)
                
                    .padding()
                VStack{
                    Text(meditationVM.meditation.title)
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                        
                    
                    Button {
                        //
                        showPlayer = true
                    } label: {
                        Label("Play", systemImage: "play.fill")
//                        Image("playButton")
//                            .resizable()
//                            .frame(width: 30, height: 30, alignment: .leading)
//                        Text("Play")
                    }
                   // UIScreen.main.bounds.height
                    // UIScreen.main.bounds.width
                    .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.07)
                        .foregroundColor(Color.black)
                            .background(Color.white)
                            .shadow(radius: 10)
                            .cornerRadius(70)
                            .padding(15)

                }
               
                Text(meditationVM.meditation.description)
                    .font(.system(size: 20))
               
                    .foregroundColor(Color.white)
                    
                
                
                
                    
                Spacer()
            }
          
            .frame(width: UIScreen.main.bounds.width * 1, height: UIScreen.main.bounds.height * 0.7)
            .background(Color.black)
//                .position(x: 322, y: 520)
                .padding()
                .opacity(0.9)
            
           
        } .background(Color.black)
//        .ignoresSafeArea()
            .fullScreenCover(isPresented: $showPlayer) {
            playerPage(meditationVM: meditationVM)
        }
//        }
    }
}

struct meditationChoosePage_Previews: PreviewProvider {
    
    static let meditationVM = meditationViewModel(meditation: Meditation.data)
        
    static var previews: some View {
//        Group{
//            meditationChoosePage(meditationVM: meditationVM).previewDevice("iPhone 11 Pro")
//            meditationChoosePage(meditationVM: meditationVM).previewDevice("iPhone 11")
//            meditationChoosePage(meditationVM: meditationVM).previewDevice("iPhone 8")
//            meditationChoosePage(meditationVM: meditationVM).previewDevice("iPhone SE (2nd generation)")
//        }
        meditationChoosePage(meditationVM: meditationVM)
            .environmentObject(audioManager())
    }
        
}
