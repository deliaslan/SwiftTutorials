//
//  LandmarkList.swift
//  LandmarksSwiftUI
//
//  Created by Adem Deliaslan on 28.03.2022.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandMarks: [LandMark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView{
            //        List(landmarks, id: \.id) { landmark in
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                        .font(.headline)
                }
                ForEach(filteredLandMarks) { landmark in
                    
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                        
                    } label: {
                        LandmarkRow(landmark: landmark)
                        //            LandmarkRow(landmark: landmarks[0])
                        //            LandmarkRow(landmark: landmarks[1])
                    }
                }
            }.navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 12 Pro", "iPhone SE (3rd generation)"], id: \.self) { deviceName in
            LandmarkList()
                .environmentObject(ModelData())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
