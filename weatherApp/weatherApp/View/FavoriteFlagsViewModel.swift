import Foundation

class FavoriteFlagsViewModel {
    private let favoriteFlagsDataName = "favorite_flags_list"
    private let flagsDataExtension = "json"
    
    var favoriteFlagList: [Flags] = []
    
    let cellIdentifier = "flag-cell"
    var numberOfSections: Int { 1 }
    var numberOfRows: Int { favoriteFlagList.count }
    
    init() {
        updateView()
        print("Número de flags favoritos cargados: \(favoriteFlagList.count)")
    }
    
    func flag(at indexPath: IndexPath) -> Flags {
        favoriteFlagList[indexPath.row]
    }
    
    func updateView() {
        favoriteFlagList = loadFavoriteFlags()
    }
    
    private func loadFavoriteFlags() -> [Flags] {
        guard let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return []
        }
        
        let favoriteFlagsURL = documentsURL.appendingPathComponent("\(favoriteFlagsDataName).\(flagsDataExtension)")
        
        if !FileManager.default.fileExists(atPath: favoriteFlagsURL.path) {
            createInitialFlagsFile(at: favoriteFlagsURL)
        }
        
        do {
            let flagsData = try Data(contentsOf: favoriteFlagsURL)
            let flagsList = try JSONDecoder().decode([Flags].self, from: flagsData)
            return flagsList
        } catch {
            print("Error al cargar los flags favoritos: \(error.localizedDescription)")
            return []
        }
    }
    
    private func createInitialFlagsFile(at url: URL) {
        do {
            let initialFlags = [Flags]() // Aquí puedes inicializar con datos iniciales si es necesario
            let jsonData = try JSONEncoder().encode(initialFlags)
            try jsonData.write(to: url)
        } catch {
            print("Error al crear el archivo de flags favoritos: \(error.localizedDescription)")
        }
    }
    
}
