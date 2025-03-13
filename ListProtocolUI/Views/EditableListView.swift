//
//  EditableRowView.swift
//  ListProtocolUI
//
//  Created by Phil Kelly on 3/12/25.
//

// https://www.swiftyplace.com/blog/swiftui-foreach-more-than-just-loops-in-swift

// MARK: - EditableListView

import SwiftUI

var heading1FontSize: CGFloat = 18
var heading2FontSize: CGFloat = 16
var headingColor: Color = .blue

/**
 Display and provide user interations for the list.
 */
struct EditableListView: View {
    var heading1: String
    var heading2: String
    @Environment(EditableList.self) private var fruits
    @State var selectedItem: EditableRow
    
    var body: some View {
        VStack(alignment:.leading) {
            
            VStack(alignment: .leading) {
                Text(heading1)
                    .foregroundColor(headingColor)
                    .font(.system(size: heading1FontSize))
                    .padding(.top)
                Spacer()
                
                Text(heading2)
                HStack {
                    // The .onMove modifier is available on ForEach but not List: use ForEach instead.
                    List(selection: $selectedItem) {
                        ForEach(fruits.rows, id: \.self) { row in        // \.self is needed to highlight selection
                            EditableRowView(EditableRow: row)
                                .contextMenu {
                                    Button(action: {
                                        print("select item: \(selectedItem), item to delete item: \(row)")
                                        fruits.deleteItem(for: row)
                                    }) {
                                        Text("Delete")
                                    }
                                }
                        }
                        .onMove{indices, offset in
                            withAnimation {
                                fruits.moveRow(at: indices, to: offset)
                            }
                        }
                        
                        Button(action: {
                            let newItem = EditableRow(name: "New Item \(fruits.rows.count)", image: "")
                            fruits.insertRows(at: [fruits.rows.count], as: [newItem])
                        }, label: {
                            Label("Add", systemImage: "plus")
                        })
                    }
                    .onDeleteCommand {
                        print("select item: \(selectedItem)")
                        let idx = fruits.rows.firstIndex(where: { $0.id == selectedItem.id } )
                        if idx != nil {
                            fruits.deleteRows(at: [idx!])
                        }
                    }
                    .onChange(of: selectedItem) { oldSelection, newSelection in
                        fruits.selectedRow(oldSelection: oldSelection, newSelection: newSelection)
                    }
                }
            }
            .padding()
            
            VStack {
                Button(action: {
                    for row in fruits.rows {
                        print(row.name)
                    }
                }, label: {
                    Text("Print the list")
                })
                .padding()
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    @Previewable @State var fruits = EditableList(rows: gFruits)
    EditableListView(heading1: "Available Items", heading2: "Select an item:", selectedItem: fruits.selectedRow)
        .environment(fruits)
}
