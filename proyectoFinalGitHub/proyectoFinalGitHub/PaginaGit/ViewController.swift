//
//  ViewController.swift
//  proyectoFinalGitHub
//
//  Created by Diplomado on 11/01/25.
//

import UIKit

class ViewController: UIViewController {

    //OUTLET
    @IBOutlet weak var textFieldUserName: UITextField!
    @IBOutlet weak var buttonGetFollowers: UIButton!
    
    var usernameController: String!

    @IBAction func buttonGetFollowers(_ sender: Any) {
        guard let username = textFieldUserName.text, !username.isEmpty else { return }
        
        // Realizar la solicitud para obtener los seguidores
        fetchFollowers(for: username) { followers, error in
            DispatchQueue.main.async {
                print("User", username)
                self.usernameController = username
                if let error = error {
                    print("Hubo un error")
                    // Si hubo un error, muestra una alerta
                    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                    
                } else if let followers = followers {
                    // Si hay seguidores, navega a la pantalla de FollowersViewController
                    //print("Entro")
                    self.navigateToFollowersScreen(with: followers)
                    
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Boton al principio oculto hasta que no este bien el textfield
        
        buttonGetFollowers.isHidden = true
        
        //Cada vez que se cambie el texto se verificara lo del boton
        textFieldUserName.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }


    @objc func textFieldDidChange() {
        if let text = textFieldUserName.text, !text.isEmpty {
            buttonGetFollowers.isHidden = false
        } else {
            buttonGetFollowers.isHidden = true
        }
    }
    
    func fetchFollowers(for username: String, completion: @escaping ([User]?, Error?) -> Void) {
        // URL
        guard let url = URL(string: "https://api.github.com/users/\(username)/followers") else {
            return
        }
        
        // solicitud GET
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            // Intentar decodificar los datos a la estructura 'User'
            do {
                let followers = try JSONDecoder().decode([User].self, from: data!)
                completion(followers, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
        
    }
    
    func navigateToFollowersScreen(with followers: [User]) {
        let followersVC = storyboard?.instantiateViewController(withIdentifier: "FollowersViewController") as! FollowersViewController
        
        //Pasar la informacion 
        followersVC.followers = followers
        followersVC.userFollow = usernameController
        //print("VIEWCONTROLLER", followers)
        navigationController?.pushViewController(followersVC, animated: true)
        navigationItem.title = "Search"
    }

}

