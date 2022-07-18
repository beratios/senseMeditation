//
//  testPage.swift
//  senseMeditation
//
//  Created by Berat Gültekin on 7.07.2022.
//

import SwiftUI

struct testPage: View {
  
    
    var body: some View {
        VStack{
            
            List(mainPageArray) { denemes in
                Text(denemes.description)
               }
            
        }
    }
}

struct testPage_Previews: PreviewProvider {
    static var previews: some View {
        testPage()
    }
}
