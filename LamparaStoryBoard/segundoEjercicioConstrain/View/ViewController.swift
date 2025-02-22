//
//  ViewController.swift
//  segundoEjercicioConstrain
//
//  Created by Diplomado on 28/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = off
        
        focoApagado.isHidden = true
        
        focoPrendido.isHidden = true
    }
    
    
    @IBOutlet weak var pantalla: UIImageView!
    @IBOutlet weak var focoPrendido: UIImageView!
    @IBOutlet weak var focoApagado: UIImageView!
    
    private let on = UIColor(red: 1, green: 1, blue:1, alpha: 1)
    private let off = UIColor(red: 0, green: 0, blue:0, alpha: 1)
    private var isOn = false // Variable para el estado
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        isOn.toggle() //Alterna el estado
        
        if isOn{
            print("El botón está siendo oprimido")
            view.backgroundColor = on
            focoPrendido.isHidden = false //desaparecerlo
            focoApagado.isHidden = true
            
            
        }else{
            print("El botón no está siendo oprimido")
            view.backgroundColor = off
            focoApagado.isHidden = false
            focoPrendido.isHidden = true
            
        }
        
    }


    
}


