//
//  DetailsView.swift
//  Firebase101
//
//  Created by Adem Deliaslan on 2.06.2022.
//

import SwiftUI
import FirebaseFirestore
struct DetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
      //  @ObservedObject var viewModel: ViewModel
        
       
    
    var body: some View {
        Text("Detay Sayfası")
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
