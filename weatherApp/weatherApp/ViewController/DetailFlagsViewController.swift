//
//  DetailFlagsPizzaViewController.swift
//  weatherApp
//
//  Created by Diplomado on 07/02/25.
//


import UIKit

class DetailFlagsViewController: UITableViewController {
    private let viewModel = DetailFlagsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        
        // celda personalizada
        tableView.register(FlagCellViewController.self,
                           forCellReuseIdentifier: viewModel.flagsCellIdentifier)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.update()
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.flagsCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.flagsCellIdentifier, for: indexPath) as? FlagCellViewController else {
            return UITableViewCell()
        }
        
        let flags = viewModel.flags(at: indexPath)
        
        let flagName: String
        if viewModel.isFavorite(flag: flags) {
            flagName = flags.name + " ♥️"
        } else {
            flagName = flags.name
        }
        

        cell.configure(with: flagName, image: UIImage(named: flags.name))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let flags = viewModel.flags(at: indexPath)
        print("Tocando \(flags)")
        let flagsDetailViewController = UbicationFlagsViewController(flags: flags)
        navigationController?.pushViewController(flagsDetailViewController, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let flags = viewModel.flags(at: indexPath)
        
        // Verificar si el pais ya está en favoritos
        if viewModel.isFavorite(flag: flags) {
            // Si ya es favorito, solo mostrar la acción de eliminar
            let deleteFavoriteAction = UIContextualAction(style: .destructive, title: "Remove from favorites") { [weak self] _, _, completion in
                self?.viewModel.deleteFlagFromFavorites(at: indexPath)
                completion(true)
            }
            
            deleteFavoriteAction.backgroundColor = .black
            deleteFavoriteAction.image = UIImage(systemName: "bolt.heart.fill")
            
            return UISwipeActionsConfiguration(actions: [deleteFavoriteAction])
        } else {
            // Si no es favorito, mostrar la acción de agregar a favoritos
            let favoriteAction = UIContextualAction(style: .normal, title: "Add to favorites") { [weak self] _, _, completion in
                self?.viewModel.addFlagToFavorites(at: indexPath)
                completion(true)
            }
            
            favoriteAction.backgroundColor = .red
            favoriteAction.image = UIImage(systemName: "heart")
            
            return UISwipeActionsConfiguration(actions: [favoriteAction])
        }
    }
}

extension DetailFlagsViewController: FlagListViewModelDelegate {
    func shouldReloadTableData() {
        tableView.reloadData()
    }
}
