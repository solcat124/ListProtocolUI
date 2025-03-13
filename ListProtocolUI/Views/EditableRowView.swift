//
//  EditableRowView.swift
//  ListProtocolUI
//
//  Created by Phil Kelly on 3/12/25.
//


//
//  SiteView.swift
//  ListUI
//
//  Created by Phil Kelly on 3/6/25.
//

// Version 1 works. It uses 2 lists, a global list and a view list. Changes to the view list are made to the global list.

/*
 A model defines a list. A user can modify the list through a view. Any changes in the view are applied to the model list.
 Supported user actions:
    Delete item (backspace, delete, or control-right-click)
    Add item (add button appearing in the list)
    Move items (drag and move)
    Change selection (report change in selection)
 
 Note: control-right-click delete deletes the row where the control-right-click takes place, which may not be the selected (highlighted) row. Backspace and delete keys remove the selected (highlighted) row.
 */

// https://www.swiftyplace.com/blog/swiftui-foreach-more-than-just-loops-in-swift

// MARK: - View Code

import SwiftUI

var heading1FontSize: CGFloat = 18
var heading2FontSize: CGFloat = 16
var headingColor: Color = .blue

/**
 Display a given item in the list.
 */
struct EditableRowProtocolView: View {
    @State var EditableRow: any EditableRowProtocol
    
    var body: some View {
        HStack {
            TextField("", text: $EditableRow.name, onCommit: {
                print(EditableRow.name)
                EditableRow.renameRow(to: EditableRow.name)  //renameEditableRow(EditableRow)
            })
            Text(EditableRow.image)
        }
    }
}

/**
 Display and provide user interations for the list.
 */
struct EditableListProtocolView: View {
    @Environment(EditableList.self) private var fruits
    @State var selectedItem: EditableRow
    
    var body: some View {
        VStack(alignment:.leading) {
            
            VStack(alignment: .leading) {
                Text("Available EditableList")
                    .foregroundColor(headingColor)
                    .font(.system(size: heading1FontSize))
                    .padding(.top)
                Spacer()
                
                Text("Select a EditableRow:")
                HStack {
                    // The .onMove modifier is available on ForEach but not List: use ForEach instead.
                    List(selection: $selectedItem) {
                        ForEach(fruits.rows, id: \.self) { row in        // \.self is needed to highlight selection
                            EditableRowProtocolView(EditableRow: row)
                                .contextMenu {
                                    Button(action: {
                                        print("select item: \(selectedItem), item to delete item: \(row)")
                                        fruits.deleteItem(for: row)
                                    }) {
                                        Text("Delete")
                                    }
                                }
                        }
//                        .onMove{indices, offset in
//                            withAnimation {
//                                model.moveRow(at: indices, to: offset)
////                                reorderEditableList(EditableList)
//                            }
//                        }
                        
                        Button(action: {
                            let newItem = EditableRow(name: "New Item \(fruits.rows.count)", image: "")
                            fruits.insertRows(at: [fruits.rows.count], as: [newItem])
////                            addEditableRow(newItem)
                        }, label: {
                            Label("Add", systemImage: "plus")
                        })
                    }
                    .onDeleteCommand {
                        print("select item: \(selectedItem)")
                        let idx = fruits.rows.firstIndex(where: { $0.id == selectedItem.id } )
                        if idx != nil {
                            fruits.deleteRows(at: [idx!])
//                            removeEditableRow(at: idx!)
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
                    Text("Print EditableList")
                })
                .padding()
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    @Previewable @State var fruits = EditableList(rows: gFruits)
    EditableListProtocolView(selectedItem: fruits.selectedRow)
        .environment(fruits)
}
