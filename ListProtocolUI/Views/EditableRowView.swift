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

// MARK: - EditableRowView Code

import SwiftUI

/**
 Display a given item in the list.
 */
struct EditableRowView: View {
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

#Preview(traits: .sizeThatFitsLayout) {
    @Previewable @State var fruits = EditableList(rows: gFruits)
    EditableRowView(EditableRow: fruits.rows[0])
}
