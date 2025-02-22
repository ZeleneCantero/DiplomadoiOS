//
//  ViewController.swift
//  segundoEjercicioConstrain
//
//  Created by Diplomado on 28/09/24.
//

import UIKit

class LamparaView: UIView {
    
     lazy var imageOn: UIImageView = {
        let imageOn = UIImageView()
        imageOn.image = UIImage(named: "focoEncendido")
         imageOn.contentMode = .scaleAspectFit
        imageOn.isHidden = false
        imageOn.clipsToBounds = true
        return imageOn
    }()
    
     lazy var imageOf: UIImageView = {
        let imageOf = UIImageView()
        imageOf.image = UIImage(named: "focoApagado")
         imageOf.contentMode = .scaleAspectFit
        imageOf.isHidden = false
         imageOf.clipsToBounds = true
        return imageOf
    }()

    
     lazy var buttonOnOf: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.cornerStyle = .large
        configuration.background.backgroundColor = .systemBlue
        configuration.baseForegroundColor = .black
        configuration.title = "Button"
        button.configuration = configuration
        button.setContentHuggingPriority(.required, for: .vertical)
        return button
    }()
    
    

    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setMainStack()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var mainStack: UIStackView = {
       let stackView = UIStackView()
       stackView.translatesAutoresizingMaskIntoConstraints = false
       stackView.axis = .vertical
       stackView.distribution = .fillProportionally
       stackView.alignment = .center
       stackView.spacing = 80
        
        stackView.layoutMargins = UIEdgeInsets(top: 250, left: 150, bottom: 250, right: 150)
        stackView.isLayoutMarginsRelativeArrangement = true
       return stackView
   }()
   
    
    private func setMainStack() {
        addSubview(mainStack)
       
        NSLayoutConstraint.activate([
            mainStack.heightAnchor.constraint(equalToConstant: 290),
            mainStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
        mainStack.addArrangedSubview(imageOn)
        mainStack.addArrangedSubview(buttonOnOf)
        mainStack.addArrangedSubview(imageOf)

        imageOn.heightAnchor.constraint(equalTo: imageOf.heightAnchor, multiplier: 1).isActive = true
        imageOn.widthAnchor.constraint(equalTo: imageOf.widthAnchor, multiplier: 0.5).isActive = true

    }
    
    private func addContainerView() {
        let centerY = containerView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        centerY.priority = .defaultLow
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            containerView.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
            containerView.topAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            centerY
        ])
    }
    

    
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = off
//        
//        focoApagado.isHidden = true
//        
//        focoPrendido.isHidden = true
//    }
//    
//    
//    @IBOutlet weak var pantalla: UIImageView!
//    @IBOutlet weak var focoPrendido: UIImageView!
//    @IBOutlet weak var focoApagado: UIImageView!
//    
//    private let on = UIColor(red: 1, green: 1, blue:1, alpha: 1)
//    private let off = UIColor(red: 0, green: 0, blue:0, alpha: 1)
//    private var isOn = false // Variable para el estado
//    
//    @IBAction func buttonPressed(_ sender: UIButton) {
//        isOn.toggle() //Alterna el estado
//        
//        if isOn{
//            print("El botón está siendo oprimido")
//            view.backgroundColor = on
//            focoPrendido.isHidden = false //desaparecerlo
//            focoApagado.isHidden = true
//            
//            
//        }else{
//            print("El botón no está siendo oprimido")
//            view.backgroundColor = off
//            focoApagado.isHidden = false
//            focoPrendido.isHidden = true
//            
//        }
//        
//    }


    
}

