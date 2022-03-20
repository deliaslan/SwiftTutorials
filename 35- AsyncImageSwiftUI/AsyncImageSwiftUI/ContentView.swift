//
//  ContentView.swift
//  AsyncImageSwiftUI
//
//  Created by Adem Deliaslan on 20.03.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        
        NavigationView {
            VStack {
                
                AsyncImage(url: URL(string: "https://media.licdn.com/media/AAYQAgTPAAgAAQAAAAAAACeUyGWuWBhQQLyxe1gEMEaZgw.png")!) { image in
                    image.resizable().frame(width: 300, height: 300, alignment: .center)
                } placeholder: {
                    ProgressView()
                }

                
                List(superHeroArray) { superhero in
                    Text(superhero.name)
                        .font(.title3)
                        .foregroundColor(.blue)
                }.navigationTitle(Text("Super Heroes Book"))}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
