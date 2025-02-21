//
//  ViewController.swift
//  CalculadoraIMC
//
//  Created by Diplomado on 05/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ingresarAltura: UITextField!
    @IBOutlet weak var ingresarPeso: UITextField!
    @IBOutlet weak var botonCalcularIMC: UIButton!
    
    var peso: Double = 0.0
    var altura: Double = 0.0
    var imcCalculado: Double = 0.0
    var rangoIMC: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Deshabilitar el botón al inicio
        botonCalcularIMC.isEnabled = false
        // Agregar observadores a los campos de texto para detectar cambios
           ingresarAltura.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
           ingresarPeso.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc private func textFieldDidChange() {
           // Habilitar el botón si ambos campos tienen texto
           if let pesoTexto = ingresarPeso.text, !pesoTexto.isEmpty,
              let alturaTexto = ingresarAltura.text, !alturaTexto.isEmpty {
               botonCalcularIMC.isEnabled = true
           } else {
               botonCalcularIMC.isEnabled = false
           }
       }
    
    private func calculoIMC(peso: Double, altura: Double) -> Double{
        return peso/(altura*altura)
    }
    
    private func rangoIMCString(imCalculado: Double) -> String{
        let imc = peso/(altura*altura)
        
        if imc < 18.5{
            rangoIMC = "Bajo Peso"
        }else if imc > 18.5 && imc < 24.9 {
            rangoIMC = "Normal"
        }else if imc > 25 && imc < 29.9{
            rangoIMC = "Sobrepeso"
        }else if imc > 30 && imc < 34.9{
            rangoIMC = "ObesidadI"
        }else if imc > 35 && imc < 39.9{
            rangoIMC = "ObesidadII"
        }else if imc > 40 && imc < 49.9{
            rangoIMC = "ObesidadIII"
        }else if imc > 50{
            rangoIMC = "ObesidadIV"
        }
        return rangoIMC
        
    }
    
    @IBAction func calcularIMCBoton(_ sender: Any) {
        if let pesoTexto = ingresarPeso.text , !pesoTexto.isEmpty , let alturaTexto = ingresarAltura.text, !alturaTexto.isEmpty {
            peso = Double(pesoTexto)!
            altura = Double(alturaTexto)!/100
            print("Si es un numero")
            imcCalculado = calculoIMC(peso: peso, altura: altura)
            rangoIMC = rangoIMCString(imCalculado: imcCalculado)
                
            performSegue(withIdentifier: "IMC", sender: nil)

        }else{
            //botonCalcularIMC.isEnabled = false
            showAlert(title: "Error", message: "Ingrese numeros solamente.")
        }
    }
    
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let calculoIMC = segue.destination as? ResultadoIMC {
            calculoIMC.imcValor = imcCalculado
            calculoIMC.rango = rangoIMC
            calculoIMC.peso = peso
            calculoIMC.altura = altura
            
            
        }
    }
}

