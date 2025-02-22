//
//  Flags.swift
//  weatherApp
//
//  Created by Diplomado on 07/02/25.
//

//"id": 1,
//"nombre": "London"

import Foundation

struct Flags: Codable {
        let id: Int
        let name: String
        
    private enum CodingKeys: String, CodingKey {
        case id
        case name = "nombre"
    }
}

extension Flags: Equatable, Hashable {
    static func == (lhs: Flags, rhs: Flags) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
