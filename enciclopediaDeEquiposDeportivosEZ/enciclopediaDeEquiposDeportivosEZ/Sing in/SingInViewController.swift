//  SingInViewController.swift
//  enciclopediaDeEquiposDeportivosEZ
//
//  Created by Zelene Yosseline Isayana Montes Cantero on 11/12/24.
//

import UIKit
class SingInViewController: UIViewController {
      
    @IBOutlet weak var textFieldUserName: UITextField!
    
    @IBOutlet weak var textFieldCorreo: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var textFieldConfirmPassword: UITextField!
    
    @IBAction func buttonSingIn(_ sender: Any) {
        if textFieldPassword.text == textFieldConfirmPassword.text {
            let alert = UIAlertController(title: "Sing In", message: "Registro exitoso", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Sing In", message: "Contraseñas diferentes", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
