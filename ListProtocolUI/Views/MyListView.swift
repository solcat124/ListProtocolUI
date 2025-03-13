//
//  MyListView.swift
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
struct MyListView: View {
    @Environment(EditableList.self) private var mylist
    
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
    @Previewable @State var mylist = EditableList(rows: gFruits)
    @Previewable @State var heading1 = "Available EditableList"
    @Previewable @State var heading2 = "Select an EditableRow:"
    MyListView(heading1: "Available fruits", heading2: "Select a fruit:", selectedItem: mylist.selectedRow)
        .environment(mylist)
}
