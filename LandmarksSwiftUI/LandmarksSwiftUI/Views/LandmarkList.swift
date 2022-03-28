//
//  LandmarkList.swift
//  LandmarksSwiftUI
//
//  Created by Adem Deliaslan on 28.03.2022.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView{
            //        List(landmarks, id: \.id) { landmark in
            List(landmarks) { landmark in
                
                NavigationLink{
                    LandmarkDetail(landmark: landmark)
                
                } label: {
                    LandmarkRow(landmark: landmark)
                    //            LandmarkRow(landmark: landmarks[0])
                    //            LandmarkRow(landmark: landmarks[1])
                }
            }.navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 12 Pro", "iPhone SE (3rd generation)", "iPhone 8", "iPad Pro (9.7-inch)"], id: \.self) { deviceName in
        LandmarkList()
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}
