//
//  FollowersViewController.swift
//  proyectoFinalGitHub
//
//  Created by Diplomado on 11/01/25.
//



import UIKit

class FollowersViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelNumFollowers: UILabel!
    
    var followers: [User] = [] // Supongamos que User tiene propiedades login y avatar_url
    var favorites: [String] = []
    var userFollow: String! // Asumiendo que userFollow se establece antes de presentar este controlador
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        labelUserName.text = userFollow
        labelNumFollowers.text = "Número de seguidores: \(followers.count)"
        
        // Cargar favoritos desde UserDefaults
        if let savedFavorites = UserDefaults.standard.stringArray(forKey: "favorites") {
            favorites = savedFavorites
        }
    }
    
    @IBAction func buttonAddFavorites(_ sender: Any) {
        if favorites.contains(userFollow) {
            showAlert(title: "Error!", message: "Este usuario ya está agregado como favorito.")
        } else {
            favorites.append(userFollow)
            UserDefaults.standard.set(favorites, forKey: "favorites")
            showAlert(title: "Agregado!", message: "Usuario \(userFollow!) agregado como favorito.")
            
            // Notificar a FavoritesViewController que se agregó un favorito
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadFavorites"), object: nil)
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension FollowersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return followers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FollowersCollectionViewCell
        
        let user = followers[indexPath.row]
        cell.label.text = user.login
        
        if let imageURL = URL(string: user.avatar_url) {
            URLSession.shared.dataTask(with: imageURL) { data, _, _ in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        cell.image.image = image
                    }
                }
            }.resume()
        }
        
        return cell
    }
}

extension FollowersViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}
