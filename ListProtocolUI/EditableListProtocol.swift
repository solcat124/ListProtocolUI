//
//  EditableRowModel.swift
//  ListProtocolUI
//
//  Created by Phil Kelly on 3/13/25.
//


//
//  EditableList.swift
//  ListProtocolUI
//
//  Created by Phil Kelly on 3/12/25.
//

// editable list on iOS: https://www.swiftbysundell.com/articles/building-editable-swiftui-lists/

import Foundation


// MARK: - Protocol

protocol EditableRowModel: Identifiable, Hashable {
    var id: UUID { get }
    var name: String { get set }
    var image: String { get set }
    
    mutating func renameRow(to name: String)
}

protocol EditableListModel {
    associatedtype RowModel: EditableRowModel
    
    var rows: [RowModel] { get set }
    
    mutating func moveRow(at source: IndexSet, to destination: Int)
    mutating func insertRows(at indices: IndexSet, as newElements: [RowModel])
    mutating func deleteItem(for row: RowModel)
    mutating func deleteRows(at indices: IndexSet)
    mutating func selectedRow(oldSelection: RowModel, newSelection: RowModel)
}

// MARK: - Model Code

struct Fruit: EditableRowModel {
    var id: UUID = UUID()
    var name: String
    var image: String
    
    mutating func renameRow(to name: String) {
        self.name = name
    }
}

@Observable class Fruits {
    var rows: [Fruit] = [
        Fruit(name: "Apple"         , image: "🍎"),
        Fruit(name: "Banana"        , image: "🍌"),
        Fruit(name: "Orange"        , image: "🍊"),
        Fruit(name: "Strawberry"    , image: "🍓"),
        Fruit(name: "Blueberry"     , image: "🫐" ),
    ]
    var selectedRow = 0
}

extension Fruits: EditableListModel {
    typealias RowModel = Fruit
    
    func renameRow(at source: IndexSet, to name: String) {
        print("rename row")
        for index in source {
            renameRow(at: IndexSet([index]), to: name)
        }
    }
    
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
//        for index in indices.reversed() {
//            rows.remove(atOffsets: indices)
//        }
    }
    
    func selectedRow(oldSelection: RowModel, newSelection: RowModel) {
        print("selected \(oldSelection.name) to \(newSelection.name)")
    }
}

