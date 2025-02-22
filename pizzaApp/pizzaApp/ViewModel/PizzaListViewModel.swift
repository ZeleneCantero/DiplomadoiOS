//
//  PizzaListViewModel.swift
//  pizzaApp
//
//  Created by Diplomado on 25/01/25.
//

import UIKit

protocol PizzaListViewModelDelegate {
    func shouldReloadTableData()
}

class PizzaListViewModel {

    private let pizzaDataFileName = "pizza-info"
    private let favoritePizzaFileName = "favorite_pizza_list"
    private let pizzaDataFileExtension = "json"
    
    
    private var pizzaList: [PizzaData.Pizzas] = []
    
    var favoritePizza: Set<PizzaData.Pizzas> = []
    
    let pizzaCellIdentifier = "pizza-cell"
    
    var pizzaCount: Int { pizzaList.count }
    
    var delegate: PizzaListViewModelDelegate?
    
    init() {
        reloadPizzaData()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(saveFavoritePizza),
                                               name: UIApplication.willResignActiveNotification,
                                               object: nil)
    }
    
    func reloadPizzaData(){
        self.pizzaList = loadPizzaData()
        self.favoritePizza = Set(loadFavoritePizzaData())
    }
    
    func loadPizzaData() -> [PizzaData.Pizzas] {
        // Primero intentar cargar desde el directorio de documentos
        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
            in: .userDomainMask).first {
            let jsonFilePath = documentsDirectory.appendingPathComponent("pizza-info.json")
            
            if let pizzaData = try? Data(contentsOf: jsonFilePath),
               let pizzaInfo = try? JSONDecoder().decode(PizzaData.self, from: pizzaData) {
                return pizzaInfo.pizzas
            }
        }
        
        // Si no existe en documentos, cargar desde el Bundle
        guard let fileURL = Bundle.main.url(forResource: pizzaDataFileName,
                                            withExtension: pizzaDataFileExtension),
              let pizzaData = try? Data(contentsOf: fileURL),
              let pizzaInfo = try? JSONDecoder().decode(PizzaData.self, from: pizzaData)
        else {
            assertionFailure("Cannot find \(pizzaDataFileName).\(pizzaDataFileExtension)")
            return []
        }
        
        return pizzaInfo.pizzas
    }
    
    private func loadFavoritePizzaData() -> [PizzaData.Pizzas] {
        guard let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return []
        }
        
        let favoritePizzaURL = documentsURL.appendingPathComponent("\(favoritePizzaFileName).\(pizzaDataFileExtension)")
        
        if !FileManager.default.fileExists(atPath: favoritePizzaURL.path) {
            // Create an empty array of favorite pizzas if the file doesn't exist
            let emptyList: [PizzaData.Pizzas] = []
            saveFavoritePizza()
            return emptyList
        }
        
        do {
            let favoritePizzaData = try Data(contentsOf: favoritePizzaURL)
            let favoritePizzaList = try JSONDecoder().decode([PizzaData.Pizzas].self, from: favoritePizzaData)
            return favoritePizzaList
        } catch {
            assertionFailure("Cannot load favorite pizza file: \(error.localizedDescription)")
            return []
        }
    }

    
    func pizza(at position: IndexPath) -> PizzaData.Pizzas {
        pizzaList[position.row]
    }
    
    func isFavorite(pizza: PizzaData.Pizzas) -> Bool {
        favoritePizza.contains(pizza)
    }
    
    func addPizzaToFavorites(at indexPath: IndexPath) {
        let pizza = pizza(at: indexPath)
        
        favoritePizza.insert(pizza)
        saveFavoritePizza()
        delegate?.shouldReloadTableData()
    }
    
    //Eliminar pokemon de favoritos
    func deletePizzaFromFavorites(at indexPath: IndexPath) {
        let pizza = pizza(at: indexPath)
        guard favoritePizza.contains(pizza) else {
            return
        }
        favoritePizza.remove(pizza)
        saveFavoritePizza()
        delegate?.shouldReloadTableData()
        
    }
    
    @objc
    func saveFavoritePizza() {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
                                                                in: .userDomainMask).first
        else {
            assertionFailure("Couldn't find documents directory")
            return
        }
        
        let filename = "\(favoritePizzaFileName).\(pizzaDataFileExtension)"
        let fileURL = documentsDirectory.appending(component: filename)
        
        let favoritePizza = Array(favoritePizza).sorted(by: { $0.name > $1.name })
        
        do {
            let favoritePizzaData = try JSONEncoder().encode(favoritePizza)
            
            let jsonFavoritePizza = String(data: favoritePizzaData, encoding: .utf8)
            
            try jsonFavoritePizza?.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            assertionFailure("Cannot encode favorite pizza: \(error.localizedDescription)")
        }
    }
}
