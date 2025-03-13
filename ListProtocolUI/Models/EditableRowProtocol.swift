//
//  EditableRowProtocol.swift
//  ListProtocolUI
//
//  Created by Phil Kelly on 3/13/25.
//

import Foundation


// MARK: - Protocol

protocol EditableRowProtocol: Equatable {
    var id: UUID { get }
    var name: String { get set }
    var image: String { get set }
    
    mutating func renameRow(to name: String)
}
