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
    @State private var filter = FilterCategory.all
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        
        var id: FilterCategory { self }
    }
    
    var filteredLandMarks: [LandMark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
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
            }
            .navigationTitle(title)
            .frame(minWidth: 300)
#if !os(watchOS)
            .toolbar {
                ToolbarItem {
                    
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
#endif
            Text("Select a Landmark")

        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
     //   ForEach(["iPhone 12 Pro", "iPhone SE (3rd generation)"], id: \.self) { deviceName in
            LandmarkList()
                .environmentObject(ModelData())
          //      .previewDevice(PreviewDevice(rawValue: deviceName))
            //    .previewDisplayName(deviceName)
 //       }
    }
}
