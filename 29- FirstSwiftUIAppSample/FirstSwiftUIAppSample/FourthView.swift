//
//  FourthView.swift
//  FirstSwiftUIAppSample
//
//  Created by Adem Deliaslan on 5.03.2022.
//

import SwiftUI

struct FourthView: View {
    
    @State var myName = "Adem"
    @State var isChanged = false
    var body: some View {
        VStack {
            Text(myName)
                .padding()
            Button {
               
                if isChanged == false {
                    self.myName = "Çiğdem"
                    isChanged = true
                } else {
                    self.myName = "Adem"
                    isChanged = false
                }
                
            } label: {
                Text("Click Me!")
                    .padding()
            }

        }
    }
}

struct FourthView_Previews: PreviewProvider {
    static var previews: some View {
        FourthView()
    }
}
