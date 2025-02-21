//
//  mostrarDatos.swift
//  CalculadoraDePropinas
//
//  Created by Diplomado on 05/10/24.
//

import UIKit

class MostrarDatos: UIViewController {
    @IBOutlet weak var informacion: UITextView!
    var montoTotal: Double = 0.0
    var propina: Double = 0.0
    var montoIngresado: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        informacion.text = """
            Monto ingresado: \(montoIngresado)
            Propina: \(propina)
            Monto total a pagar: \(montoTotal)
            
            
"""

    }
    

}
