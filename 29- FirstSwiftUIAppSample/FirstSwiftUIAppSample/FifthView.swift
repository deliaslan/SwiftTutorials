//
//  FifthView.swift
//  FirstSwiftUIAppSample
//
//  Created by Adem Deliaslan on 6.03.2022.
//

import SwiftUI

struct FifthView: View {
    
    @State var myName = "Adem"
    
    var body: some View {
        VStack {
            Text(myName)
                .font(.largeTitle)
                .padding()
            TextField("PlaceHolder", text: $myName) //Binding için $ işareti ekliyoruz
                .padding()
                .font(.largeTitle)
        }
    }
}

struct FifthView_Previews: PreviewProvider {
    static var previews: some View {
        FifthView()
    }
}
