//
//  ContentView.swift
//  LandmarksSwiftUI
//
//  Created by Adem Deliaslan on 27.03.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
    // LandmarkList()
        BadgeBackground()
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
