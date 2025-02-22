//
//  pizza.swift
//  pizzaApp
//
//  Created by Diplomado on 25/01/25.
//

import Foundation

// PIZZAS
struct PizzaData: Codable {
    
    var pizzas: [Pizzas]
    let pizzerias: [Pizzerias]
    var ingredients: [String]
    
    struct Pizzas: Codable, Equatable, Hashable {
        
        let name: String
        let ingredients: [String]
        
        static func == (lhs: Pizzas, rhs: Pizzas) -> Bool {
            return lhs.name == rhs.name
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(name)
        }
    }
    
    // PIZZERIAS
    struct Pizzerias: Codable, Hashable, Equatable {
        let name: String
        let address: String
        let coordinates: Coordinate?
        
        
        static func == (lhs: Pizzerias, rhs: Pizzerias) -> Bool {
            return lhs.name == rhs.name
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(name)
        }
    }

    struct Coordinate: Codable {
        let latitude: Double
        let longitude: Double
    }
}
