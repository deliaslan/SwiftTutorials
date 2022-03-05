//
//  SecondView.swift
//  FirstSwiftUIAppSample
//
//  Created by Adem Deliaslan on 5.03.2022.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        Image("26")
            .resizable()
            .aspectRatio(contentMode: .fit)
            //.frame(width: 350, height: 230, alignment: .center)
            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.25, alignment: .center)
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
