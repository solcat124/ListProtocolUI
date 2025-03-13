//
//  ContentView.swift
//  ListProtocolUI
//
//  Created by Phil Kelly on 3/12/25.
//

import SwiftUI

var gMyFruits = Fruits()

struct ContentView: View {
    @State var myFruits = gMyFruits
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        
        EditableListView(model: $myFruits, selectedItem: Fruit(name: "", image: ""))
    }
}

#Preview {
    ContentView()
}
