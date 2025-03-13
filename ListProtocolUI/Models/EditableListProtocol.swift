//
//  EditableListProtocol.swift
//  ListProtocolUI
//
//  Created by Phil Kelly on 3/13/25.
//

import Foundation


// MARK: - Protocol

protocol EditableRow: Identifiable, Hashable {
    var id: UUID { get }
    var name: String { get set }
    var image: String { get set }
    
    mutating func renameRow(to name: String)
}

protocol EditableList {
    associatedtype RowModel: EditableRow
    
    var rows: [RowModel] { get set }
    
    mutating func moveRow(at source: IndexSet, to destination: Int)
    mutating func insertRows(at indices: IndexSet, as newElements: [RowModel])
    mutating func deleteItem(for row: RowModel)
    mutating func deleteRows(at indices: IndexSet)
    mutating func selectedRow(oldSelection: RowModel, newSelection: RowModel)
}
