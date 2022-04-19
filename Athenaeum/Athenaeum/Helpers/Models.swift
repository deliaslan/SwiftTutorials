//
//  Models.swift
//  Athenaeum
//
//  Created by Adem Deliaslan on 19.04.2022.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content { build() }
}



