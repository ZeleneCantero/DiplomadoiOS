//
//  ResultadoIMC.swift
//  CalculadoraIMC
//
//  Created by Diplomado on 05/10/24.
//

import UIKit

class ResultadoIMC: UIViewController {
    
    var imcValor: Double = 0.0
    var rango: String = ""
    var altura: Double = 0.0
    var peso: Double = 0.0
    
    @IBOutlet weak var pesoText: UITextField!
    @IBOutlet weak var imcText: UITextField!
    @IBOutlet weak var alturaText: UITextField!
    @IBOutlet weak var rangoText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pesoText.text = "\(peso)"
        imcText.text = String(format: "%.2f", imcValor)
        rangoText.text = "\(rango)"
        alturaText.text = "\(altura)"
        
        // Do any additional setup after loading the view.
    }
    
}
