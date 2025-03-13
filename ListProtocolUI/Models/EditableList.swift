//
//  Fruits.swift
//  ListProtocolUI
//
//  Created by Phil Kelly on 3/12/25.
//

// editable list on iOS: https://www.swiftbysundell.com/articles/building-editable-swiftui-lists/

import Foundation


// MARK: - Fruits

@Observable class Fruits {
    var rows: [Fruit]
    var selectedRow: Fruit {
        get {
            if let index = rows.firstIndex(where: { $0.isSelected == true } ) {
                return rows[index]
            }
            return rows[0]
        }
    }
    
    init(rows: [Fruit]) {
        if rows.isEmpty {
            self.rows = [Fruit(name: "unknown")]
        } else {
            self.rows = rows
        }
    }
}

// MARK: - Fruits, Extension EditableListProtocol

extension Fruits: EditableListProtocol {
    typealias RowModel = Fruit
    
    func moveRow(at source: IndexSet, to destination: Int) {
        print("move rows")
        rows.move(fromOffsets: source, toOffset: destination)
    }
    
    func insertRows(at indices: IndexSet, as newElements: [Fruit]) {
        print("insert rows")
        for (index, element) in zip(indices, newElements) {
            rows.insert(element, at: index)
        }
    }
    
    func deleteItem(for row: RowModel) {
        print("delete item")
        if let idx = rows.firstIndex(where: { $0.id == row.id }) {
            rows.remove(at: idx)
        }
    }
    
    func deleteRows(at indices: IndexSet) {
        print("delete rows")
        rows.remove(atOffsets: indices)
    }
    
    func selectedRow(oldSelection: RowModel, newSelection: RowModel) {
        print("selected \(oldSelection.name) to \(newSelection.name)")
        oldSelection.isSelected = false
        newSelection.isSelected = true
    }
}
