//
//  LandmarkList.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Adem Deliaslan on 31.03.2022.
//

//
//  LandMarkListWatch.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Adem Deliaslan on 31.03.2022.
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
                        .font(.footnote)
                }
                ForEach(filteredLandMarks) { landmark in
                    
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                        
                    } label: {
                        LandmarkRow(landmark: landmark)
                            .font(.footnote)
                        //            LandmarkRow(landmark: landmarks[0])
                        //            LandmarkRow(landmark: landmarks[1])
                    }
                }
            }
            .scaledToFit()
            .navigationTitle("Landmarks")
         
        }
    }
}

struct LandmarkListWatch_Previews: PreviewProvider {
    static var previews: some View {
        
            LandmarkList()
                .environmentObject(ModelData())
            
        }
    }


