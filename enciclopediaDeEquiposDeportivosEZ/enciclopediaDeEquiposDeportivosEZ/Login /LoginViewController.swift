//
//  ViewController.swift
//  enciclopediaDeEquiposDeportivosEZ
//
//  Created by Zelene Yosseline Isayana Montes Cantero on 11/12/24.
//

import UIKit

class LoginViewController: UIViewController {
    struct users {
        var correo: String
        var name: String
        var password: String
    }
    
    // Define los detalles para cada Pokémon
    var allUsers: [String: users] = [
        "zelene": users(correo: "zelenecantero19@gmail.com",
                        name: "zelene",
                        password: "1234")]
    
    
    
    
    //OUTLET
    //Label
    @IBOutlet weak var textFieldUserName: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    //Buttons
    
    //Button Register
    @IBAction func buttonRegister( sender: Any) {
        
        
    }
    
    
    //Button Login
    @IBAction func buttonLogin( sender: Any) {
        if textFieldUserName.text?.isEmpty ?? true || textFieldPassword.text?.isEmpty ?? true {
            if textFieldUserName.text?.isEmpty ?? true{
                let alert = UIAlertController(title: "Error", message: "Ingrese Usuario", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default)
                alert.addAction(action)
                present(alert, animated: true)
            } else if textFieldPassword.text?.isEmpty ?? true {
                let alert = UIAlertController(title: "Error", message: "Ingrese Contraseña", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default)
                alert.addAction(action)
                present(alert, animated: true)
            }
        } else{
            if  allUsers[textFieldUserName.text!]?.name != textFieldUserName.text {
                let alert = UIAlertController(title: "Error", message: "Usuario no registrado", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default)
                alert.addAction(action)
                present(alert, animated: true)
            } else{
                if textFieldPassword.text == allUsers[textFieldUserName.text!]?.password{
                    print(textFieldPassword.text)
                    print(allUsers[textFieldUserName.text!]?.password)
                    print("Contraseñas iguales")
                    //performSegue(withIdentifier: "nextScreenSingIn", sender: nil)
                }else{
                    let alert = UIAlertController(title: "Error", message: "Contraseña incorrecta", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .default)
                    alert.addAction(action)
                    present(alert, animated: true)
                }
            }
        }
            
           
}

//override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if segue.identifier == "nextScreenSingIn" {
//        // Verificar que el destino sea InformationPokemonViewController
//        if let destinationVC = segue.destination as? SingInViewController {
//            }
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    

}
