//
//  EditableListProtocol.swift
//  ListProtocolUI
//
//  Created by Phil Kelly on 3/13/25.
//

import Foundation


// MARK: - Protocol

protocol EditableListProtocol {
    associatedtype RowModel: EditableRowProtocol
    
    var rows: [RowModel] { get set }
    
    mutating func moveRow(at source: IndexSet, to destination: Int)
    mutating func insertRows(at indices: IndexSet, as newElements: [RowModel])
    mutating func deleteItem(for row: RowModel)
    mutating func deleteRows(at indices: IndexSet)
    mutating func selectedRow(oldSelection: RowModel, newSelection: RowModel)
}
