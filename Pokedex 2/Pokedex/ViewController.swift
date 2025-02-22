// Protocolo para enviar los pokemones favoritos
protocol UpdateTableViewDelegate: AnyObject {
    func updateTableView(withFavorites favorites: [String])
}

import UIKit

class ViewController: UIViewController{
    //Variables
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    

    //Arreglo
    //Sin busqueda
    var arrayPokemones = ["Bulbasaur", "Charmander", "Squirtle", "Bellsprout", "Tentacool", "Seel", "Lickitung", "Horsea", "Magikarp", "Lapras"]
    var arrayPokemonesNum = ["0001", "0004", "0007", "0069", "0072", "0086", "0108", "0116", "0129", "0131"]
    
    //Con busqueda
    //Con numeros
    var searchPokemones: [String] = []
    var searchPokemonesForNumber: [String] = []
    
    //Con string
    var searchPokemonesNumber: [String] = []
    var searchPokemonesString: [String] = []
    
    var favoritePokemon: [String] = []
    
    var selectedPokemon: String = ""
    
    //Booleanos
    var isSearching = false
    
    var isNumberOrText = 0
    
    weak var favoriteViewController: FavoriteViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Datos persistentes
        if let savedPokemonesFavorite = UserDefaults.standard.stringArray(forKey: "favoritePokemon") {
            favoritePokemon = savedPokemonesFavorite
        }
        
        //Tabla
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //Search bar
        searchBar.delegate = self
        
        
        if let tabBarController = self.tabBarController,
           let itemsAddVC = tabBarController.viewControllers?[2] as? FavoriteViewController {
            print("ENTRO")
            favoriteViewController = itemsAddVC
            itemsAddVC.delegate = self
        }
    }
    
    // Función para agregar a favoritos y actualizar la tabla
    func addToFavorites(_ pokemonName: String) {
        if let favoriteViewController = favoriteViewController {
            favoritePokemon.append(pokemonName)
            favoriteViewController.updateTableView(withFavorites: favoritePokemon)
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Busqueda
        if isSearching == true{
            //Busqueda por numero
            if isNumberOrText == 1 {
                return searchPokemonesForNumber.count
                
            //Busqueda por texto
            }else if isNumberOrText == 2{
                return searchPokemonesNumber.count
                
            }
            
            //No hay busqueda
        }else if isSearching == false{
            return arrayPokemones.count
           
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cv1 = tableView.dequeueReusableCell(withIdentifier: "cv1")
        if cv1 == nil {
            cv1 = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cv1")
        }

        guard let cell = cv1 else {
            fatalError("Failed to get a cell!")
        }

        cell.accessoryType = .disclosureIndicator //la barrita de lado
        
        if isSearching == true {
            if isNumberOrText == 1 {
                print("ENTRE NUMEROS")
                cell.detailTextLabel?.text = searchPokemonesForNumber[indexPath.row]
                cell.textLabel?.text = searchPokemonesString[indexPath.row]
                
            }else if isNumberOrText == 2{
                print("ENTRE STRING")
                cell.detailTextLabel?.text = searchPokemonesNumber[indexPath.row]
                cell.textLabel?.text = searchPokemones[indexPath.row]
            }
            
            //No hay busqueda
        }else if isSearching == false{
            cell.textLabel?.text = arrayPokemones[indexPath.row]
            cell.detailTextLabel?.text = arrayPokemonesNum[indexPath.row]
        }
      
        return cell
        
    }

}


extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            // Si el campo de búsqueda está vacío, mostrar todos los elementos
            isSearching = false
            searchPokemones = []
            searchPokemonesNumber = [] // Limpiar el arreglo de números de Pokémon
            searchPokemonesForNumber = []
            searchPokemonesString = []
        } else {
            if let _ = Int(searchText){
                isNumberOrText = 1
                print("BUSQUEDA POR NUMEROS")

                // Filtrar productos que coincidan con el texto de búsqueda
                searchPokemonesForNumber = arrayPokemonesNum.filter { $0.lowercased().prefix(searchText.count) == searchText.lowercased() }
                print("SEARCH POKEMONES", searchPokemonesForNumber)
                
                // Obtener los índices de los elementos filtrados en el arreglo original
                let indices = searchPokemonesForNumber.compactMap { arrayPokemonesNum.firstIndex(of: $0) }
                print("Indices de los elementos filtrados: \(indices)")
                
                // Limpiar el arreglo de números de Pokémon antes de agregar nuevos valores
                searchPokemonesString = []
                
                // Usar los índices para agregar los números correspondientes a searchPokemonesNumber
                for index in indices {
                    print("INDEX", index)
                    print("POKEMONES", arrayPokemones[index])
                    searchPokemonesString.append(arrayPokemones[index])
                }
                
                print("Números de Pokémon correspondientes: \(searchPokemonesString)")
                
                isSearching = true
                tableView.reloadData()
                
            
            }else{
                isNumberOrText = 2
                print("BUSCA POR NOMBRE")
            
            
            // Filtrar productos que coincidan con el texto de búsqueda
            searchPokemones = arrayPokemones.filter { $0.lowercased().prefix(searchText.count) == searchText.lowercased() }
            print("SEARCH POKEMONES", searchPokemones)
            
            // Obtener los índices de los elementos filtrados en el arreglo original
            let indices = searchPokemones.compactMap { arrayPokemones.firstIndex(of: $0) }
            print("Indices de los elementos filtrados: \(indices)")
            
            // Limpiar el arreglo de números de Pokémon antes de agregar nuevos valores
            searchPokemonesNumber = []
            
            // Usar los índices para agregar los números correspondientes a searchPokemonesNumber
            for index in indices {
                if index < arrayPokemonesNum.count {
                    print("INDICE", index)
                    searchPokemonesNumber.append(arrayPokemonesNum[index])
                }
            }
            
            print("Números de Pokémon correspondientes: \(searchPokemonesNumber)")
            
            isSearching = true
        }
    }
        
        // Recargar la tabla para mostrar los resultados filtrados
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let favoriteAction = UITableViewRowAction(style: .normal, title: "Favoritos") { [self] (action, indexPath) in
            // Aquí puedes manejar la lógica cuando se selecciona "Favoritos"
            // Por ahora, simplemente puedes imprimir un mensaje
            print("Agregado a favoritos: \(self.arrayPokemones[indexPath.row])")
            
            if favoritePokemon.contains(arrayPokemones[indexPath.row]){
                print("REPETIDO")
            }else{
                favoritePokemon.append(self.arrayPokemones[indexPath.row])
                print("ARREGLO", favoritePokemon)
                
                //Datos persistentes
                UserDefaults.standard.set(favoritePokemon, forKey: "favoritePokemon")
                favoriteViewController?.updateTableView(withFavorites: favoritePokemon)
            }
        }
        favoriteAction.backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 204/255, alpha: 1.0) // Puedes ajustar el color de fondo del botón de acción

        return [favoriteAction]
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deseleccionar la celda después de ser seleccionada
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Obtener el Pokémon seleccionado
        selectedPokemon = arrayPokemones[indexPath.row]
        
        print("POKEMON SELECCIONADO", selectedPokemon)
        // Realizar la transición al InformationPokemonViewController
        performSegue(withIdentifier: "nextScreen", sender: selectedPokemon)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextScreen" {
            // Verificar que el destino sea InformationPokemonViewController
            if let destinationVC = segue.destination as? InformationPokemonViewController {
                // Pasar los datos al InformationPokemonViewController
                if let pokemonName = sender as? String {
                    destinationVC.selectedPokemon = selectedPokemon
                    // Aquí puedes configurar cualquier otro dato necesario en el view controller de destino
                }
            }
        }
    }

}


extension ViewController: FavoriteViewControllerDelegate {
    func didDeletePokemon(_ favoritePokemon: [String]) {
        self.favoritePokemon = favoritePokemon
        tableView.reloadData()
    }
}

