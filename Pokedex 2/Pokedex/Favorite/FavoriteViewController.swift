import UIKit

// Protocolo para delegar la eliminación de productos
protocol FavoriteViewControllerDelegate: AnyObject {
    func didDeletePokemon(_ favoritePokemon: [String])
}

class FavoriteViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    weak var delegate: FavoriteViewControllerDelegate?
    var favoritePokemon: [String] = []
    var selectedPokemon: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Datos persistentes
        if let savedPokemonesFavorite = UserDefaults.standard.stringArray(forKey: "favoritePokemon") {
            favoritePokemon = savedPokemonesFavorite
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.reloadData()
    }
    
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource, UpdateTableViewDelegate {
    func updateTableView(withFavorites favorites: [String]) {
        
        favoritePokemon = favorites
        print("FAVORITES", favoritePokemon)
        if tableView != nil {
            tableView.reloadData()
        } else {
            print("tableView is nil")
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritePokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = favoritePokemon[indexPath.row]
        cell.accessoryType = .disclosureIndicator //la barrita de lado
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let favoriteAction = UITableViewRowAction(style: .normal, title: "Eliminar") { [weak self] (action, indexPath) in
            guard let self = self else { return }
            
            // Eliminar el elemento del arreglo
            self.favoritePokemon.remove(at: indexPath.row)
            print("Nuevo arreglo", favoritePokemon)
            self.delegate?.didDeletePokemon(self.favoritePokemon)
            UserDefaults.standard.set(favoritePokemon, forKey: "favoritePokemon")
            // Actualizar la tabla
            self.tableView.reloadData()
        }
        
        favoriteAction.backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 204/255, alpha: 1.0) // Ajustar el color de fondo del botón de acción
        
        return [favoriteAction]
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deseleccionar la celda después de ser seleccionada
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Obtener el Pokémon seleccionado
        selectedPokemon = favoritePokemon[indexPath.row]
        
        print("POKEMON SELECCIONADO", selectedPokemon)
        // Realizar la transición al InformationPokemonViewController
        performSegue(withIdentifier: "nextScreenFavorites", sender: selectedPokemon)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextScreenFavorites" {
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

