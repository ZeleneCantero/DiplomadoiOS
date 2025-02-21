//
//  ViewController.swift
//  CalculadoraDePropinas
//
//  Created by Diplomado on 05/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var monto: UITextField!
    @IBOutlet weak var calcularPropina: UIButton!
    @IBOutlet weak var porcentaje: UISegmentedControl!
    
    var montoValor: Double = 0.0
    var propina: Double = 0.0
    var totalPago: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func doLogin(_ sender: UIButton) {
        
        if let montoTexto = monto.text , !montoTexto.isEmpty {
            print("No esta vacio")
            montoValor = Double(montoTexto) ?? 0
            let indiceSegmentedControl = porcentaje.selectedSegmentIndex
            propina = calcularPropinaPorcentaje(montoValor: montoValor, indice: indiceSegmentedControl)
            totalPago = montoValor + propina

            
            //Indice de porcentaje
            print(indiceSegmentedControl)
            
            //Funcion de elegir 10% ....
            print(propina)
            
            //La suma entre la propina y el monto total
            print(totalPago)
            
            performSegue(withIdentifier: "MostrarMonto", sender: nil)
            
        }else{
            showAlert(title: "Error", message: "Llene el campo de monto.")
        }
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    private func calcularPropinaPorcentaje(montoValor: Double, indice: Int) -> Double{
        switch indice{
        case 0:
            return Double(montoValor) * 0.10
            
        case 1:
            return Double(montoValor) * 0.15
        
        case 2:
            return Double(montoValor) * 0.20
            
        default:
            return 0.0
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destino = segue.destination as? MostrarDatos {
            destino.montoTotal = totalPago
            destino.propina = propina
            destino.montoIngresado = montoValor
            
        }
    }
}



