//
//  DessertsView.swift
//  ListProtocolUI
//
//  Created by Phil Kelly on 3/12/25.
//

// https://www.swiftyplace.com/blog/swiftui-foreach-more-than-just-loops-in-swift

// MARK: - View Code

import SwiftUI

/**
 Display and provide user interations for the list.
 */
struct DessertsView: View {
    @Environment(EditableList.self) private var desserts
    
    @State var heading1: String
    @State var heading2: String
    @State var selectedItem: EditableRow

    var body: some View {
        VStack(alignment:.leading) {
            EditableListView(heading1: heading1, heading2: heading2, selectedItem: selectedItem)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    @Previewable @State var desserts = EditableList(rows: gDesserts)
    FruitView(heading1: "Available desserts", heading2: "Select a dessert:", selectedItem: desserts.selectedRow)
        .environment(desserts)
}
