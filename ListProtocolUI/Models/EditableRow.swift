//
//  EditableRow.swift
//  ListProtocolUI
//
//  Created by Phil Kelly on 3/13/25.
//

// editable list on iOS: https://www.swiftbysundell.com/articles/building-editable-swiftui-lists/

import Foundation


// MARK: - EditableRow

@Observable class EditableRow: Identifiable, Hashable {
    var id: UUID = UUID()
    var name: String
    var image: String
    var isSelected: Bool
    
    init(id: UUID = UUID(), name: String = "new item", image: String = "", isSelected: Bool = false) {
        self.id = id
        self.name = name
        self.image = image
        self.isSelected = isSelected
    }
    
    // Use of @Observable requires explicit definition for Equatable.
    static func == (lhs: EditableRow, rhs: EditableRow) -> Bool {
        lhs.id == rhs.id
    }

    // Use of @Observable requires explicit definition for Hashable.
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

// MARK: - EditableRow, Extension EditableRowProtocol

extension EditableRow: EditableRowProtocol {
    func renameRow(to name: String) {
        self.name = name
    }
}
