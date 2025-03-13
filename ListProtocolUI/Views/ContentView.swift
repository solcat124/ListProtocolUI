//
//  ContentView.swift
//  ListProtocolUI
//
//  Created by Phil Kelly on 3/12/25.
//

import SwiftUI

// Initial list to display.
let gFruits: [EditableRow] = [
    EditableRow(name: "Apple"         , image: "🍎"   , isSelected: true),
    EditableRow(name: "Banana"        , image: "🍌"),
    EditableRow(name: "Orange"        , image: "🍊"),
    EditableRow(name: "Strawberry"    , image: "🍓"),
    EditableRow(name: "Blueberry"     , image: "🫐"),
]

// Initial list to display.
let gDesserts: [EditableRow] = [
    EditableRow(name: "Apple Strudel"       , image: "🍎"),
    EditableRow(name: "Banana Pie"          , image: "🍌"),
    EditableRow(name: "Orange Jello"        , image: "🍊"),
    EditableRow(name: "Strawberry Custard"  , image: "🍓"   , isSelected: true),
    EditableRow(name: "Blueberry Crumble"   , image: "🫐"),
]

struct ContentView: View {
    @State private var fruits = EditableList(rows: gFruits)
    @State private var desserts = EditableList(rows: gDesserts)

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        
        EditableListView(heading1: "Available fruits", heading2: "Select a fruit", selectedItem: fruits.selectedRow)
            .environment(fruits)
            .padding()
        
        EditableListView(heading1: "Available desserts", heading2: "Select a dessert:", selectedItem: desserts.selectedRow)
            .environment(desserts)
            .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    @Previewable @State var fruits = EditableList(rows: gFruits)
    ContentView()
}
