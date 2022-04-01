//
//  ContentView.swift
//  Memorize
//
//  Created by Adem Deliaslan on 1.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
    
            HStack{
                ZStack {
                    RoundedRectangle(cornerRadius: 20.0)
                        .stroke(lineWidth: 3)
                    Text("Hello World")
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20.0)
                        .stroke(lineWidth: 3)
                    Text("Hello World")
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20.0)
                        .stroke(lineWidth: 3)
                    Text("Hello World")
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20.0)
                        .stroke(lineWidth: 3)
                    Text("Hello World")
                }
                
            }
            .padding(.horizontal)
            .foregroundColor(.red)
            
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    
}
