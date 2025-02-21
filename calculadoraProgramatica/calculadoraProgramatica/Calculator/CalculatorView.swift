//
//  CalculatorView.swift
//  calculadoraProgramatica
//
//  Created by Zelene Yosseline Isayana Montes Cantero on 29/10/24.
//

import UIKit

class CalculatorView: UIView {
    
    // Numeros
    // 4, 5, 6, 8, 9 , 10, 12, 13, 14,16
    
    //Operaciones
    // 2, 3, 7, 11, 15
    
    //Resultado
    //18
    
    //Reset
    //0
    
    //Mas, menos
    // 1
    
    
    //Para poder acceder a todos a la clase CalculatorViewController
    var calculatorViewController: CalculatorViewController?
    var arraySignsCalculator = ["AC", "+/-", "%", "/", "7", "8", "9", "x", "4", "5", "6", "-", "1", "2", "3", "+", "0", ".", "="]
    
    lazy var screenOperations: UITextField = {
        let screenOperation = UITextField()
        screenOperation.textAlignment = .right
        screenOperation.tintColor = .black
        screenOperation.font = UIFont.systemFont(ofSize:50)
        return screenOperation
    }()
    
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setMainStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var mainStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    private func setMainStack() {
        addSubview(mainStack)      
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
        mainStack.addArrangedSubview(screenOperations)
        mainStack.addArrangedSubview(createStacksButtonsCalculator(inicio: 0, fin: 3))
        mainStack.addArrangedSubview(createStacksButtonsCalculator(inicio: 4, fin: 7))
        mainStack.addArrangedSubview(createStacksButtonsCalculator(inicio: 8, fin: 11))
        mainStack.addArrangedSubview(createStacksButtonsCalculator(inicio: 12, fin: 15))
        mainStack.addArrangedSubview(createStacksButtonsCalculator(inicio: 16, fin: 18))
        
        
        
    }
    
    func createStacksButtonsCalculator(inicio: Int, fin: Int) -> UIStackView{
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 5
        
        for i in inicio...fin {
            let button = UIButton()
            button.tag = i
            
            var configuration = UIButton.Configuration.plain()
            configuration.title = arraySignsCalculator[i]// el .normal, es que el titulo aparecera cuando este en su estado normal
            button.tintColor = .white
            print(i)
            if i == 3 || i == 7 || i == 11 || i == 15 || i == 18{
                button.backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 255/255, alpha: 1.0)
            }else if i == 0 || i == 1 || i == 2 {
                button.backgroundColor = UIColor(red: 210/255, green: 180/255, blue: 222/255, alpha: 1.0)
            }else{
                button.backgroundColor = UIColor(red: 190/255, green: 160/255, blue: 210/255, alpha: 0.8)
            }
            button.layer.cornerRadius = 45 // Ajusta este valor según el tamaño de tu botón
            button.clipsToBounds = true
            button.configuration = configuration
            //#selector, estás refiriéndote a un método específico que se invocará cuando ocurra un evento,
            button.addTarget(self, action: #selector(calculatorViewController?.buttonCalculator(_:)), for: .touchUpInside)
            stack.addArrangedSubview(button)
            }
        return stack
            
        }
    
    @objc func buttonCalculator(_ sender: UIButton) {
         calculatorViewController?.buttonCalculator(sender)
     }
    
}
