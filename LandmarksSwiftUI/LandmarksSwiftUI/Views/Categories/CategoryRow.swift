//
//  CategoryRow.swift
//  LandmarksSwiftUI
//
//  Created by Adem Deliaslan on 29.03.2022.
//

import SwiftUI

struct CategoryRow: View {
    var categoryNme: String
    var items: [LandMark]
    
    var body: some View {
        VStack(alignment: .leading){
            Text(categoryNme)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        CategoryItem(landmark: landmark)
                    }
                }
            }
            .frame(height: 185)
            
           
            }
        }
    }


struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        CategoryRow(
            categoryNme: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(4))
        )
    }
}
