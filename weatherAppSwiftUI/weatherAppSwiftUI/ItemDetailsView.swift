//
//  ItemDetailsView.swift
//  weatherAppSwiftUI
//
//  Created by RMS on 14/04/2023.
//

import SwiftUI

struct ItemDetailsView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Name: ")
                Text("Name here")
            }
            
            HStack {
                Text("Date: ")
                Text("Date here")
            }
        }
    }
}

struct ItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailsView()
    }
}
