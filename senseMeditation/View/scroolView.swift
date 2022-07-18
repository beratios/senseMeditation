//
//  scroolView.swift
//  senseMeditation
//
//  Created by Berat Gültekin on 7.07.2022.
//

import SwiftUI

struct scroolView: View {
    var meditationVM: meditationViewModel
    @State private var sheetPresented = false
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 2) {
                            ForEach(mainPageArray) {mainarrays in
                                Button {
                                    //
                                    sheetPresented = true
                                } label: {
                                    ZStack{
                                        Image(mainarrays.image)
                                            .resizable()
                                            .foregroundColor(.white)
                                            .font(.largeTitle)
                                            .opacity(0.85)
                                            .frame(width: 280, height: 160)
                                            .background(.black)
                                            
                //                            .padding(.leading,10)
                                            .shadow(radius: 20)
                                            .cornerRadius(17)
                                        VStack {
                                            
            //                                Text("2minute Relaxing")
                                            
                                            Text(mainarrays.title)
                                            .foregroundColor(Color.black)
                                                .font(.title)
                                            Text(mainarrays.description)
                                                .foregroundColor(.black)
                                            Text(mainarrays.description)
                                                .foregroundColor(.black)
                                            
                                            Spacer()
                                        }
                                            .frame( height: 150)
                                        
                                    }
                                }
                               
                                
                            }.sheet(isPresented: $sheetPresented) {
                                meditationChoosePage(meditationVM: meditationVM)
                            } .padding(.leading,7)
                                
                        }
                    }
    }

struct scroolView_Previews: PreviewProvider {
    static var previews: some View {
        scroolView(meditationVM: meditationViewModel(meditation: Meditation.data))
    }
}
}
