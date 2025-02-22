//
//  DetailFlagsViewModel.swift
//  weatherApp
//
//  Created by Zelene Yosseline Isayana Montes Cantero on 08/02/25.
//


import UIKit

protocol FlagListViewModelDelegate {
    func shouldReloadTableData()
}


class DetailFlagsViewModel {
    private let flagsDataFileName = "LocationList"
    private let flagsDataFileExtension = "json"
    
    private let favoriteFlagsFileName = "favorite_flags_list"
    
    
    var flagsList: [Flags] = []
    var favoriteFlags: Set<Flags> = []
    
    let flagsCellIdentifier = "flags-cell"
    var flagsCount: Int { flagsList.count } //Variable computada, se calcula en tiempo real
    
    var delegate: FlagListViewModelDelegate?
    
    init() {
        print("FAVORITOS: \(favoriteFlags)")
        update()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(saveFavoriteFlags),
                                               name: UIApplication.willResignActiveNotification,
                                               object: nil)
    }
    
    func loadFlagsData() -> [Flags] {
        guard let fileURL = Bundle.main.url(forResource: flagsDataFileName,
                                            withExtension: flagsDataFileExtension),
              let flagsData = try? Data(contentsOf: fileURL),
              let flagsList = try? JSONDecoder().decode([Flags].self,
                                                        from: flagsData)
        else {
            assertionFailure("Cannot find \(flagsDataFileName).\(flagsDataFileExtension)")
            return []
        }
        
        return flagsList
    }
    
    func update(){
        self.flagsList = loadFlagsData()
        self.favoriteFlags = Set(loadFavoriteFlagsData())
    }
    
    private func loadFavoriteFlagsData() -> [Flags] {
        guard let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return []
        }
        
        let favoriteFlagURL = documentsURL.appendingPathComponent("\(favoriteFlagsFileName).\(flagsDataFileExtension)")
        
        if FileManager.default.fileExists(atPath: favoriteFlagURL.path) {
            // El archivo existe, intenta cargar los datos
            do {
                let favoriteFlagsData = try Data(contentsOf: favoriteFlagURL)
                let favoriteFlagsList = try JSONDecoder().decode([Flags].self, from: favoriteFlagsData)
                return favoriteFlagsList
            } catch {
                // Error al cargar los datos
                assertionFailure("Cannot load favorite flags file: \(error.localizedDescription)")
                return []
            }
        } else {
            // El archivo no existe, crea uno nuevo con datos vacíos
            let emptyFlagsList: [Flags] = []
            
            do {
                let flagsData = try JSONEncoder().encode(emptyFlagsList)
                try flagsData.write(to: favoriteFlagURL)
                return emptyFlagsList
            } catch {
                assertionFailure("Cannot create favorite flags file: \(error.localizedDescription)")
                return []
            }
        }
    }


    
    func flags(at position: IndexPath) -> Flags {
        flagsList[position.row]
    }
    
    
    func isFavorite(flag: Flags) -> Bool {
        favoriteFlags.contains(flag)
    }
    
    func addFlagToFavorites(at indexPath: IndexPath) {
        let flag = flags(at: indexPath)
        favoriteFlags.insert(flag)
        saveFavoriteFlags() // Añadir esta línea
        delegate?.shouldReloadTableData()
    }
    
    //Eliminar pokemon de favoritos
    func deleteFlagFromFavorites(at indexPath: IndexPath) {
        let flag = flags(at: indexPath)
        print("deleteFlagFromFavorites", flag)
        guard favoriteFlags.contains(flag) else {
            return
        }
        favoriteFlags.remove(flag)
        saveFavoriteFlags()
        delegate?.shouldReloadTableData()
        
    }
    
    //Eliminar pokemon de favoritos
    func deleteFlagFromFavoritesFromUbication(at country: Flags) {
        favoriteFlags.remove(country)
        saveFavoriteFlags()
        delegate?.shouldReloadTableData()
    }
    
    func addFlagToFavoritesFromUbication(at country: Flags) {
        favoriteFlags.insert(country)
        saveFavoriteFlags()
        delegate?.shouldReloadTableData()
    }
    
    
    @objc
    func saveFavoriteFlags() {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
                                                                in: .userDomainMask).first
        else {
            assertionFailure("Couldn't find documents directory")
            return
        }
        
        let filename = "\(favoriteFlagsFileName).\(flagsDataFileExtension)"
        let fileURL = documentsDirectory.appending(component: filename)
        
        let favoriteFlag = Array(favoriteFlags).sorted(by: { $0.id > $1.id })
        
        do {
            let favoriteFlagData = try JSONEncoder().encode(favoriteFlag)
            
            let jsonFavoriteFlag = String(data: favoriteFlagData, encoding: .utf8)
            
            try jsonFavoriteFlag?.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            assertionFailure("Cannot encode favorite flags: \(error.localizedDescription)")
        }
    }

}
