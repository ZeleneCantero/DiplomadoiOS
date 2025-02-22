//
//  MenuTeamsViewController.swift
//  enciclopediaDeEquiposDeportivosEZ
//
//  Created by Zelene Yosseline Isayana Montes Cantero on 11/12/24.
//

import UIKit

protocol ViewControllerAddFavoriteDelegate: AnyObject {
    func didAddTeam(_ teamFavorite: [String])
}

protocol ViewControllerDeleteTeamDelegate: AnyObject {
    func didDeleteTeam(_ teamFavorite: [String])
}

class MenuTeamsViewController: UIViewController {
    
    // Protocolo
    weak var delegateAddTeam: ViewControllerAddFavoriteDelegate?
    
    // Arrays
    let arrayTeamsNFLlabel = ["Kansas City Chiefs", "Bufalo Bills", "Detroit Lions", "Washington Commanders", "Miami Dolphins"]
    let arrayTeamsNFL = ["Kansas City Chiefs", "Bufalo Bills", "Detroit Lions", "Washington Commanders", "Miami Dolphins"]
    
    // Busqueda
    var arraySearchLabel: [String] = []
    var arraySearchImage: [String] = []
    
    var arrayFavoriteTeam: [String] = []
    
    // Siguiente pagina
    var nextScreen: String = ""
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Cargar equipos favoritos guardados
        if let savedTeamFavorite = UserDefaults.standard.stringArray(forKey: "favoriteTeam") {
            arrayFavoriteTeam = savedTeamFavorite
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        searchBar.delegate = self
        
        // Configurar delegados con FavoriteViewController
        if let tabBarController = self.tabBarController,
           let favoriteVC = tabBarController.viewControllers?[1] as? FavoriteViewController {
            // Establecer delegados cruzados
            delegateAddTeam = favoriteVC
            favoriteVC.delegateDeleteTeamFavorite = self
            favoriteVC.arrayFavoriteTeam = arrayFavoriteTeam
        }
    }
}

extension MenuTeamsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? arraySearchLabel.count : arrayTeamsNFLlabel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        
        // Eliminar todas las vistas anteriores para evitar duplicados
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        // Imagen
        let customImageView = UIImageView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        customImageView.contentMode = .scaleAspectFill
        customImageView.layer.cornerRadius = 25
        customImageView.clipsToBounds = true
        
        // UILabel
        let customLabel = UILabel(frame: CGRect(x: 70, y: 20, width: tableView.frame.width - 80, height: 20))
        customLabel.font = UIFont.systemFont(ofSize: 16)
        
        if isSearching {
            customImageView.image = UIImage(named: arraySearchImage[indexPath.row])
            customLabel.text = arraySearchLabel[indexPath.row]
        } else {
            customImageView.image = UIImage(named: arrayTeamsNFL[indexPath.row])
            customLabel.text = arrayTeamsNFLlabel[indexPath.row]
        }
        
        // Añadirlos a las celdas
        cell.contentView.addSubview(customImageView)
        cell.contentView.addSubview(customLabel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nextScreen = arrayTeamsNFL[indexPath.row]
        performSegue(withIdentifier: "nextScreen", sender: nextScreen)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let favoriteAction = UITableViewRowAction(style: .normal, title: "Favorito") { [weak self] (action, indexPath) in
            guard let self = self else { return }
            
            
            if self.arrayFavoriteTeam.count == 0 {
                //Por si se busca o cuando es normal
                let teamToAdd = self.isSearching ? self.arraySearchLabel[indexPath.row] : self.arrayTeamsNFLlabel[indexPath.row]
                
                self.arrayFavoriteTeam.append(teamToAdd)
                
                //UserDefaults
                UserDefaults.standard.set(self.arrayFavoriteTeam, forKey: "favoriteTeam")
                
                // Usar protocolo para notificar
                self.delegateAddTeam?.didAddTeam(self.arrayFavoriteTeam)
            } else {
                let alert = UIAlertController(title: "Favorito existente", message: "No se puede agregar otro equipo como favorito porque ya ha agregado uno", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        favoriteAction.backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 204/255, alpha: 1.0)
        
        return [favoriteAction]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextScreen" {
            if let destinationVC = segue.destination as? DetailTeamsViewController {
                destinationVC.nextScreen = nextScreen
            }
        }
    }
}

extension MenuTeamsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            arraySearchLabel = []
            isSearching = false
        } else {
            arraySearchLabel = arrayTeamsNFLlabel.filter { $0.lowercased().hasPrefix(searchText.lowercased()) }
            arraySearchImage = arraySearchLabel.map { team in
                // Mapear el nombre del equipo a su imagen correspondiente
                return arrayTeamsNFL[arrayTeamsNFLlabel.firstIndex(of: team) ?? 0]
            }
            isSearching = true
        }
        
        // Recargar la tabla para mostrar los resultados filtrados
        tableView.reloadData()
    }
}

extension MenuTeamsViewController: ViewControllerDeleteTeamDelegate {
    func didDeleteTeam(_ teamFavorite: [String]) {
        self.arrayFavoriteTeam = teamFavorite
        UserDefaults.standard.set(self.arrayFavoriteTeam, forKey: "favoriteTeam")
        tableView.reloadData()
    }
}
