//
//  musicListPage.swift
//  senseMeditation
//
//  Created by Berat Gültekin on 7.07.2022.
//

import SwiftUI

struct musicListPage: View {
    var meditationVM: meditationViewModel
    @State private var sheetPresented = false

    var body: some View {
       
        ZStack {
            
            Image("meditation1")
            
                .resizable()

//                .scaledToFill()
                .ignoresSafeArea()
            
                
            
            VStack{
                Spacer()
//                Button {
//                    sheetPresented = true
//                } label: {
//                    Image("gift")
//                    Text("Send")
//                        .sheet(isPresented: $sheetPresented) {
//                            ContentView()
//                        }
//                }

                Text("Sense Meditation")
                    .font(.largeTitle)
                    .shadow(radius: 9)
                    .frame(width: 300, height: 50)
                    .padding(.bottom,10)
                Text("You are 'Unique'")
                    .font(.system(size: 25))
                    .shadow(radius: 9)
                
                
                Spacer()
                Text("For You")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .padding(.trailing,250)
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
                Text("Popular")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .padding(.trailing,250)
                    
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
        }
//        .navigationBarTitle("")
//            .navigationBarHidden(true)
    }
    

}

struct musicListPage_Previews: PreviewProvider {
    static var previews: some View {
        musicListPage(meditationVM: meditationViewModel(meditation: Meditation.data))
        
    }
}
