//  ViewController.swift
//  Calculadora
//
//  Created by Diplomado on 21/10/24.
//

import UIKit

class CalculatorViewController: UIViewController, CalculatorViewDelegate {

    private var customView: CalculatorView {
            view as! CalculatorView
        }
        
        override func loadView() {
            view = CalculatorView ()
        }

        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .black
            customView.delegate = self
            //customView.buttonNumber.addAction(UIAction(handler: getValues(_:)), for: .touchUpInside)
            //customView.buttonOperation.addAction(UIAction(handler: getSimbol(_:)), for: .touchUpInside)
        }

let operationCalculator = ["AC", "+/-", "%", "/", "7", "8", "9", "x", "4", "5", "6", "-", "1", "2", "3", "+", "0", ".", "="]
let numberCalculator: [Double] = [0, 0, 0, 0, 7, 8, 9, 0, 4, 5, 6, 0, 1, 2, 3, 0, 0, 0, 0]
let pointValue = "." //tag 17

    var valuesC: [String] = [] //valuesS
    var valuesN: [Double] = []
    
    var numbers: [String] = []
    
    //var value1: Double = 0.0

    var banderaPoint = false
    var banderaGlobal = false //Se puede hacer operaciones si es false

    var textScreen: String!
    
    func didTapNumberButton(tag: Int) {
            if tag != 17 {
                textScreen = operationCalculator[tag]
                numbers.append(textScreen)
                 if banderaGlobal == false {
                      if customView.textCalculator.text == "0" {
                         customView.textCalculator.text = textScreen
                          //numbers.append(textScreen)
                         //customView.textCalculator.text = textCalculator(numTag: numDouble)
                      } else {
                          var temp = customView.textCalculator.text
                          temp?.append(textScreen)
                          //numbers.append(textScreen)
                         customView.textCalculator.text = temp //Duda, ver si si lo agrega
                         //customView.textCalculator.text.append(textCalculator(numTag: Double(tag)))
                      }
                 } else {
                      customView.textCalculator.text = textScreen
                      banderaGlobal = false
                 }
             
            }else{
                 let pointString = pointNumber(numTag: Double(tag))
                var temp2 = customView.textCalculator.text
                temp2?.append(pointString)
                numbers.append(pointString)
                 customView.textCalculator.text = temp2

            }
        }

        func didTapOperationButton(tag: Int) {
            
            
            if operationCalculator[tag] == "=" {
                if valuesN.isEmpty {
                    print("alert")
                    
                } else {
                    //let value2 = joinStringsAsDouble(numbers: numbers)
                    let value2 = joinStringsAsDouble(numbers: numbers) 
                    valuesN.append(value2 ?? 0)
                    numbers.removeAll()
                    let result = operation(operationC: valuesC[0])
                    customView.textCalculator.text = String(result)
                    valuesN.removeAll()
                    valuesC.removeAll()
                    banderaPoint = false
                    banderaGlobal = true
                }
            } else if operationCalculator[tag] == "AC" {
                customView.textCalculator.text = "0"
                valuesC.removeAll()
                valuesN.removeAll()
                banderaPoint = false
                banderaGlobal = false

            } else if operationCalculator[tag] == "+/-" {
                if customView.textCalculator.text == "0" {
                    print("alert")
                } else {
//
                    if let valuePN = customView.textCalculator.text, let doubleValue = Double(valuePN) {
                        valuesN.append(doubleValue)
                        let negativeC = operation(operationC: "+/-")
                        customView.textCalculator.text = String(negativeC)
                        valuesN.removeAll()
                        valuesC.removeAll()
                        numbers.removeAll()
                        
                        banderaPoint = false
                        banderaGlobal = true
                    } else {
                        print("Error: El valor no es un número válido.")
                        
                    }
                }
            } else if operationCalculator[tag] == "%" {
                if customView.textCalculator.text == "0" {
                    print("alert")
                } else {
                    if let valuePercent = customView.textCalculator.text, let doubleValue = Double(valuePercent) {
                                valuesN.append(doubleValue)
                                let percentageC = operation(operationC: "%")
                                customView.textCalculator.text = String(percentageC)
                                valuesN.removeAll()
                                valuesC.removeAll()
                                banderaPoint = false
                                banderaGlobal = true
                    } else {
                        print("Error: El valor no es un número válido.")
                        
                    }
                    
                }
            } else {
                if banderaGlobal == false {
                    //valuesC.append(customView.textCalculator.text)
                    valuesC.append(operationCalculator[tag])
                    
                    let value1 = joinStringsAsDouble(numbers: numbers)
                    valuesN.append(value1 ?? 0)
                    numbers.removeAll()
                    banderaGlobal = true
                    banderaPoint = false
                }else{
                    keepValue(tag: tag)
                    
                }
            }
        }
    
    
    func keepValue (tag: Int) {
        valuesC.append(operationCalculator[tag])
        print(valuesC[0])
        let screen = customView.textCalculator.text
        numbers.append(screen ?? "0")
        
        let resutl2 = joinStringsAsDouble(numbers: numbers)
        valuesN.append(resutl2 ?? 0)
        print(valuesN[0])
        numbers.removeAll()
    }
    

    func pointNumber(numTag: Double) -> String{
        if banderaPoint == false {
            banderaPoint = true
            return (operationCalculator[Int(numTag)])
            
        }else{
            print("alert")
            return "0"
        }
    }
    
    
    


    func joinStringsAsDouble(numbers: [String]) -> Double? {
        // Concatenar los strings usando "." como separador
        let concatenatedString = numbers.joined()
        
        // Convertir el string concatenado de vuelta a Double
        return Double(concatenatedString)
    }
    
    
   func operation(operationC: String) -> Double{
       switch operationC {
       case "+": return additionC(value1: valuesN[0], value2: valuesN[1])
       case "-": return subtractionC(value1: valuesN[0], value2: valuesN[1])
       case "x": return multiplicationC (value1: valuesN[0], value2: valuesN[1])
       case "/": return divisionC (value1: valuesN[0], value2: valuesN[1])
       case "%": return percentageC(value1: valuesN[0])
       case "+/-": return negativePositiveC (value: valuesN[0])
           
       default:
           return 0.0
       }

   }


    func additionC(value1: Double, value2: Double) -> Double {
        return value1 + value2
    }

    func subtractionC(value1: Double, value2: Double) -> Double {
        return value1 - value2
    }

    func multiplicationC(value1: Double, value2: Double) -> Double {
        return value1 * value2
    }

    func divisionC(value1: Double, value2: Double) -> Double {
        let result = value1 / value2
        let truncatedNumber = Double(String(format: "%.2f", result))!
        return truncatedNumber
    }

    func percentageC(value1: Double) -> Double {
        return value1 / 100
    }

    // Para el caso de +/-
    func negativePositiveC(value: Double) -> Double {
        return -value
    }
   

   
    
}
