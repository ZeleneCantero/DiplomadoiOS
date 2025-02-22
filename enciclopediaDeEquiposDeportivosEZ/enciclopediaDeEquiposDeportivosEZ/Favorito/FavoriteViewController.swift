//
//  FavoriteViewController.swift
//  enciclopediaDeEquiposDeportivosEZ
//
//  Created by Zelene Yosseline Isayana Montes Cantero on 15/12/24.
//

import UIKit


class FavoriteViewController: UIViewController {
    // Protocolo para borrar
    weak var delegateDeleteTeamFavorite: ViewControllerDeleteTeamDelegate?
    
    // Protocolo para agregar
    weak var delegateAddFavorite: ViewControllerAddFavoriteDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    var arrayFavoriteTeam: [String] = []

    //Siguiente pagina
    var nextScreen: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Persistencia de datos
        if let savedTeamFavorite = UserDefaults.standard.stringArray(forKey: "favoriteTeam") {
            arrayFavoriteTeam = savedTeamFavorite
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellFavorite")
        
        print("TABLA EN FavoriteViewController", arrayFavoriteTeam)
    }
}

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayFavoriteTeam.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellFavorite", for: indexPath)
        
        // Eliminar vistas anteriores para evitar duplicados
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        // Imagen
        let customImageView = UIImageView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        customImageView.contentMode = .scaleAspectFill
        customImageView.layer.cornerRadius = 25 // para que se vea como circulo
        customImageView.clipsToBounds = true
        
        // UILabel
        let customLabel = UILabel(frame: CGRect(x: 70, y: 20, width: tableView.frame.width - 80, height: 20))
        customLabel.font = UIFont.systemFont(ofSize: 16)
        
        // Configurar imagen y texto
        let teamName = arrayFavoriteTeam[indexPath.row]
        customImageView.image = UIImage(named: teamName)
        customLabel.text = teamName
        
        // Añadir a la celda
        cell.contentView.addSubview(customImageView)
        cell.contentView.addSubview(customLabel)
        cell.accessoryType = .disclosureIndicator //flechita de un lado
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Eliminar") { [weak self] (action, indexPath) in
            guard let self = self else { return }
            
            // Eliminando
            self.arrayFavoriteTeam.remove(at: indexPath.row)
            
            // Datos persistentes
            UserDefaults.standard.set(self.arrayFavoriteTeam, forKey: "favoriteTeam")
            
            // Actualizar tabla
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            // Protocolo
            self.delegateDeleteTeamFavorite?.didDeleteTeam(self.arrayFavoriteTeam)
        }
        
        return [deleteAction]
    }
    
    //Tamaño de la celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Equipo seleccionado: \(arrayFavoriteTeam[indexPath.row])")
        nextScreen = arrayFavoriteTeam[indexPath.row]
        performSegue(withIdentifier: "nextScreenFavorites", sender: nextScreen)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextScreenFavorites" {
            if let destinationVC = segue.destination as? DetailTeamsViewController {
                destinationVC.nextScreen = nextScreen
            }
        }
    }
}

// Implementar método de agregar favorito
extension FavoriteViewController: ViewControllerAddFavoriteDelegate {
    func didAddTeam(_ teamFavorite: [String]) {
        self.arrayFavoriteTeam = teamFavorite
        UserDefaults.standard.set(self.arrayFavoriteTeam, forKey: "favoriteTeam")
        tableView.reloadData()
    }
}
