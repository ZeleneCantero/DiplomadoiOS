//
//  FavoritesViewController.swift
//  proyectoFinalGitHub
//
//  Created by Zelene Yosseline Isayana Montes Cantero on 14/01/25.
//



import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var favorites: [String] = []
    var observer: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Cargar favoritos desde UserDefaults
        if let savedFavorites = UserDefaults.standard.stringArray(forKey: "favorites") {
            favorites = savedFavorites
        }
        
        tableView.reloadData()
        
        // Observador para actualizar la tabla cuando se agregan favoritos desde FollowersViewController
        observer = NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "reloadFavorites"), object: nil, queue: nil) { [weak self] _ in
            self?.reloadFavorites()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Cargar favoritos desde UserDefaults cada vez que la vista aparece
        if let savedFavorites = UserDefaults.standard.stringArray(forKey: "favorites") {
            favorites = savedFavorites
        }
        
        tableView.reloadData()
    }
    
    deinit {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    @objc func reloadFavorites() {
        if let savedFavorites = UserDefaults.standard.stringArray(forKey: "favorites") {
            favorites = savedFavorites
        }
        
        tableView.reloadData()
    }
}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = favorites[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            favorites.remove(at: indexPath.row)
            UserDefaults.standard.set(favorites, forKey: "favorites")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = favorites[indexPath.row]
        
        // Crear una instancia de FollowersViewController
        let followersVC = storyboard?.instantiateViewController(withIdentifier: "FollowersViewController") as! FollowersViewController
        
        // Pasar los seguidores del usuario seleccionado al controlador de seguidores
        followersVC.userFollow = selectedUser
        
        navigationController?.pushViewController(followersVC, animated: true)
    }
}
