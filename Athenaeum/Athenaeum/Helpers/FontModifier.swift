//
//  FontModifier.swift
//  Athenaeum
//
//  Created by Adem Deliaslan on 17.04.2022.
//

import SwiftUI

enum FontType: String {
    case normal = "KGMissKindergarten"
    case bold = "Sailec-Bold"
    case medium = "Sailec-Medium"
    case regular = "Sailec"
}

struct KGFont: ViewModifier {
    var type: FontType
    var size: CGFloat
    
    init(type: FontType = .regular, size: CGFloat = 16) {
        self.type = type
        self.size = size
    }
    
    
    func body(content: Content) -> some View {
        content.font(Font.custom(type.rawValue, size: size))
    }
}
