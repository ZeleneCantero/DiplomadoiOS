//
//  ViewController.swift
//  RGBColors
//
//  Created by Diplomado on 28/09/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var red: UITextField!
    @IBOutlet weak var green: UITextField!
    @IBOutlet weak var blue: UITextField!
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("Boton presionado")
        // Intentar obtener y convertir los textos de los campos
        if let textRed = red.text, let textGreen = green.text, let textBlue = blue.text,
           let rValue = Float(textRed), let gValue = Float(textGreen), let bValue = Float(textBlue) {
            print("Texto ingresado")
            
            // Crear el color RGB usando los valores directamente
            let rgb = UIColor(red: CGFloat(rValue/255), green: CGFloat(gValue/255), blue: CGFloat(bValue/255), alpha: 1)
            view.backgroundColor = rgb // Cambiar el color de la imagen
//            view.tintColor = rgb

        }else{
            print("Texto inválido")
        }
        
        
    }
    
    @IBAction func buttonPressedReset(_ sender: UIButton) {
        view.backgroundColor = .white
        
    }



}

