//  CalculatorView.swift
//  Calculadora
//
//  Created by Diplomado on 21/10/24.
//

import UIKit

class CalculatorView: UIView {

    weak var delegate: CalculatorViewDelegate?
    //Variables configuradas
        //lazy var buttonNum: UIButton = UIButton()
    var countTag = 0
    let operationCalculator = ["+", "-", "x", "/", "AC", "+/-", "%", "="]
       // let numbersCalculator = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "."]

    lazy var buttonNumber: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.cornerStyle = .large
        configuration.background.backgroundColor = .gray
        configuration.baseForegroundColor = .white
        button.layer.cornerRadius = 45 // Ajusta este valor según el tamaño de tu botón
        button.clipsToBounds = true
        button.configuration = configuration
        return button
    }()


    lazy var buttonOperation: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.cornerStyle = .large
        configuration.background.backgroundColor = .orange
        configuration.baseForegroundColor = .white
        button.layer.cornerRadius = 45 // Ajusta este valor según el tamaño de tu botón
        button.clipsToBounds = true
        button.configuration = configuration
        return button
    }()


    lazy var textCalculator: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .white
        return label
    }()

        
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var mainStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 40
        stackView.distribution = .fillEqually
        //stackView.layoutMargins = UIEdgeInsets(top: 16, left: 100, bottom: 16, right: 100)
        //stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()


        //Siempre esto cuando es programatico
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        backgroundColor = UIColor.systemPink
        setMainStack()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    //Constraint necesarios

    private func buttonConfigNumbers(text: String, tagButton: Int) -> UIButton  {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        //configuration.cornerStyle = .large
        configuration.title = text
        configuration.background.backgroundColor = .gray
        configuration.baseForegroundColor = .white
        button.layer.cornerRadius = 45 // Ajusta este valor según el tamaño de tu botón
        button.clipsToBounds = true
        button.tag = tagButton
        button.configuration = configuration
        return button
    }

    
    private func buttonConfigSignos(text: String, tagButton: Int) -> UIButton  {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        //configuration.cornerStyle = .large
        configuration.title = text
        configuration.background.backgroundColor = .orange
        configuration.baseForegroundColor = .white
        button.layer.cornerRadius = 45 // Ajusta este valor según el tamaño de tu botón
        button.clipsToBounds = true
        button.tag = tagButton
        button.configuration = configuration
        return button
    }
    

    private func setMainStack() {
        addSubview(mainStack)
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
        
        mainStack.addArrangedSubview(textCalculator)
        mainStack.addArrangedSubview(createStacksConfig(items: ["AC", "+/-", "%", "/"]))
        mainStack.addArrangedSubview(createStacksConfig(items: ["7", "8", "9", "x"]))
        mainStack.addArrangedSubview(createStacksConfig(items: ["4", "5", "6", "-"]))
        mainStack.addArrangedSubview(createStacksConfig(items: ["1", "2", "3", "+"]))
        mainStack.addArrangedSubview(createStacksConfig(items: ["0", ".", "="]))
        
    }

    private func createStacksConfig(items: [String]) -> UIView {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 10
            
            for item in items {
                let button: UIButton
                if operationCalculator.contains(item) {
                    button = buttonConfigSignos(text: item, tagButton: countTag)
                    button.addTarget(self, action: #selector(operationButtonTapped(_:)), for: .touchUpInside)
                } else {
                    button = buttonConfigNumbers(text: item, tagButton: countTag)
                    button.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
                }
                
                stackView.addArrangedSubview(button)
                countTag += 1
            }
            
            return stackView
        }
    
    
    @objc private func numberButtonTapped(_ sender: UIButton) {
            delegate?.didTapNumberButton(tag: sender.tag)
        }

        @objc private func operationButtonTapped(_ sender: UIButton) {
            //let titleButton = sender.title(for: .normal) ?? ""
            delegate?.didTapOperationButton(tag: sender.tag)
        }


    //Añadir vistas


}



protocol CalculatorViewDelegate: AnyObject {
    func didTapNumberButton(tag: Int)
    func didTapOperationButton(tag: Int)
}
