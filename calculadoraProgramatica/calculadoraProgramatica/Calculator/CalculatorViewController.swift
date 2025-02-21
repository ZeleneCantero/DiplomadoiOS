//
//  CalculatorViewController.swift
//  calculadoraProgramatica
//
//  Created by Zelene Yosseline Isayana Montes Cantero on 29/10/24.
//

import UIKit

class CalculatorViewController: UIViewController {

    var firstDigit: Double = 0.0
    var secondDigit: Double = 0.0
    var operation: String?
    var result: Double = 0.0
    
    private var customView: CalculatorView {
        return view as! CalculatorView
    }
    
    override func loadView() {
        let calculatorView = CalculatorView()
        calculatorView.calculatorViewController = self // Asignamos el controlador de vista
        view = calculatorView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 1.0, green: 182/255, blue: 193/255, alpha: 1.0)
    }
    
    //@objc. Esto permite que los elementos de Swift sean reconocidos y utilizados por el código Objective-C.
    @objc func buttonCalculator(_ sender: UIButton) {
        guard let buttonText = sender.titleLabel?.text else { return } // Para sacar el titulo del boton
        
        // botón fue presionado
        switch buttonText {
        case "+", "-", "x", "/":
            // Botones de operaciones
            setOperation(buttonText)
        case "=":
            performOperation()
        case "AC":
            //reiniciar calculadora
            resetCalculator()
        case "+/-":
            //cambiar el signo del primer dígito
            toggleSign()
        case "%":
            // calcular el porcentaje del primer dígito
            calculatePercentage()
        case "0"..."9", ".":
            // Números del 0 al 9 y punto decimal
            appendDigit(buttonText)
        default:
            break
        }
    }
    
    func appendDigit(_ digit: String) {
        // Verificar si ya hay una operación en curso
        if operation == nil {
            // No hay operación, agregamos al primer dígito
            if let currentFirstDigit = Double(customView.screenOperations.text ?? "") {
                // Si el primer dígito ya tiene decimales, no permitir agregar otro punto decimal
                if digit == "." && customView.screenOperations.text?.contains(".") == true {
                    return
                }
                customView.screenOperations.text?.append(digit)
            } else {
                // No hay primer dígito, iniciamos con el dígito presionado
                customView.screenOperations.text = digit
            }
        } else {
            // Hay una operación en curso, agregamos al segundo dígito
            if let currentSecondDigit = Double(customView.screenOperations.text ?? "") {
                // Si el segundo dígito ya tiene decimales, no permitir agregar otro punto decimal
                if digit == "." && customView.screenOperations.text?.contains(".") == true {
                    return
                }
                customView.screenOperations.text?.append(digit)
            } else {
                // No hay segundo dígito, iniciamos con el dígito presionado
                customView.screenOperations.text = digit
            }
        }
    }
    
    func setOperation(_ operation: String) {
        guard let currentText = customView.screenOperations.text, let currentNumber = Double(currentText) else {
            return
        }
        
        // Guardamos el primer número y la operación seleccionada
        firstDigit = currentNumber
        self.operation = operation
        
        // Limpiamos la pantalla para ingresar el segundo número
        customView.screenOperations.text = ""
    }
    
    func performOperation() {
        guard let currentText = customView.screenOperations.text, let currentNumber = Double(currentText) else {
            return
        }
        
        // Guardamos el segundo número y realizamos la operación
        secondDigit = currentNumber
        
        switch operation {
        case "+":
            result = operationAddition(firstDigit: firstDigit, secondDigit: secondDigit)
        case "-":
            result = operationSubtraction(firstDigit: firstDigit, secondDigit: secondDigit)
        case "x":
            result = operationMultiplication(firstDigit: firstDigit, secondDigit: secondDigit)
        case "/":
            result = operationDivision(firstDigit: firstDigit, secondDigit: secondDigit)
        default:
            break
        }
        
        // Mostramos el resultado en la pantalla
        customView.screenOperations.text = String(format: "%.2f", result)
        
        // Reiniciamos para una nueva operación
        firstDigit = 0.0
        secondDigit = 0.0
        operation = nil
    }
    
    func resetCalculator() {
        // Reseteamos todos los valores y la pantalla
        firstDigit = 0.0
        secondDigit = 0.0
        operation = nil
        result = 0.0
        customView.screenOperations.text = ""
    }
    
    func toggleSign() {
        guard let currentText = customView.screenOperations.text, var currentNumber = Double(currentText) else {
            return
        }
        
        // Cambiamos el signo del número actual
        currentNumber *= -1.0
        
        // Mostramos el número con el nuevo signo en la pantalla
        customView.screenOperations.text = String(format: "%.2f", currentNumber)
    }
    
    func calculatePercentage() {
        guard let currentText = customView.screenOperations.text, var currentNumber = Double(currentText) else {
            return
        }
        currentNumber /= 100.0
        customView.screenOperations.text = String(format: "%.2f", currentNumber)
    }
    
    // Operaciones matemáticas básicas
    
    func operationAddition(firstDigit: Double, secondDigit: Double) -> Double {
        return firstDigit + secondDigit
    }
    
    func operationSubtraction(firstDigit: Double, secondDigit: Double) -> Double {
        return firstDigit - secondDigit
    }
    
    func operationMultiplication(firstDigit: Double, secondDigit: Double) -> Double {
        return firstDigit * secondDigit
    }
    
    func operationDivision(firstDigit: Double, secondDigit: Double) -> Double {
        guard secondDigit != 0 else {
            // Manejo de división por cero
            return 0.0
        }
        return firstDigit / secondDigit
    }
    
    func operationPercentaje(firstDigit: Double) -> Double {
        return firstDigit / 100.0
    }
    
    func changeSign(firstDigit: Double) -> Double {
        return -firstDigit
    }
    
}
