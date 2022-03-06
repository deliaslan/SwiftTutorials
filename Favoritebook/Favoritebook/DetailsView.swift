//
//  DetailsView.swift
//  Favoritebook
//
//  Created by Adem Deliaslan on 7.03.2022.
//

import SwiftUI

struct DetailsView: View {
    var chosenFavoriteElement : FavoriteElements
    var body: some View {
        VStack {
            Text(chosenFavoriteElement.name)
            Text(chosenFavoriteElement.description)
            Image("sebnemferah")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.22, alignment: .center)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(chosenFavoriteElement: sebnemFerah)
    }
}
