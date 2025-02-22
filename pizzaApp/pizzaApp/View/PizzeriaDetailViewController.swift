//
//  PizzeriaDetailViewController.swift
//  pizzaApp
//
//  Created by Zelene Yosseline Isayana Montes Cantero on 29/01/25.
//

import UIKit
import MapKit
import Lottie

class PizzeriaDetailViewController: UIViewController {
    
    var pizzeria: PizzaData.Pizzerias
    private var tableView: UITableView
    
    var animationViewApp: LottieAnimationView!
    
    init(pizzeria: PizzaData.Pizzerias) {
        self.pizzeria = pizzeria
        self.tableView = UITableView(frame: .zero, style: .insetGrouped)  // Inicializamos la tabla sin ser opcional
        super.init(nibName: nil, bundle: nil)
    }
    
    lazy var labelNamePizza: UILabel = {
        var labelPizza = UILabel()
        labelPizza.text = pizzeria.name
        labelPizza.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        labelPizza.translatesAutoresizingMaskIntoConstraints = false
        return labelPizza
    }()
    
    private lazy var locationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        var confinguration = UIButton.Configuration.borderedProminent()
        confinguration.title = "Location"
        
        button.configuration = confinguration
        
        button.addTarget(self,
                         action: #selector(didTapLocationButton),
                         for: .touchUpInside)
        
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemGroupedBackground
        
        if pizzeria.coordinates == nil {
            
        }else{
            addButtonLocation()
        }
       
        setupAnimation()
        setupTableView()
        addLabelNamePizza() 
    }
    
    @objc func didTapLocationButton() {
        let pizzeriaCoordinte = CLLocationCoordinate2D(latitude: pizzeria.coordinates!.latitude,
                                                       longitude: pizzeria.coordinates!.longitude)
        let pizzaLocationViewController = PizzeriaLocationViewController(pizza: pizzeriaCoordinte)
        present(pizzaLocationViewController, animated: true)
    }

 
    func addButtonLocation() {
        view.addSubview(locationButton)
        
        // Configuración de restricciones
        NSLayoutConstraint.activate([
            locationButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 210),
            locationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
    }

    
    func setupAnimation() {
        animationViewApp = LottieAnimationView(name: "animation2")
        animationViewApp.contentMode = .scaleAspectFit
        animationViewApp.loopMode = .loop
        animationViewApp.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(animationViewApp)
        animationViewApp.play()
        
        NSLayoutConstraint.activate([
            animationViewApp.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -120),
            animationViewApp.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            animationViewApp.widthAnchor.constraint(equalToConstant: 150),
            animationViewApp.heightAnchor.constraint(equalToConstant: 150)
        ])

    }
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "detailCell")
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func addLabelNamePizza() {
        view.addSubview(labelNamePizza)
        
        NSLayoutConstraint.activate([
            labelNamePizza.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -30),
            labelNamePizza.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
    }

}

extension PizzeriaDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if pizzeria.coordinates != nil {
            return 2
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Location"
        default:
            return "Coordinates"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Mostrar solo las filas necesarias según los datos disponibles
        var rowCount = 1 // Al menos mostramos la dirección
        
        if section == 1 && pizzeria.coordinates != nil {
            rowCount = 2 // Mostramos latitude y longitude si están disponibles en la segunda sección
        }
        
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        
        switch indexPath.section {
        case 0:
            // Sección de Location
            cell.textLabel?.text = pizzeria.address
        case 1:
            // Sección de Coordinates
            switch indexPath.row {
            case 0:
                if let latitude = pizzeria.coordinates?.latitude {
                    cell.textLabel?.text = "Latitude: \(latitude)"
                }
            case 1:
                if let longitude = pizzeria.coordinates?.longitude {
                    cell.textLabel?.text = "Longitude: \(longitude)"
                }
            default:
                break
            }
        default:
            break
        }
        
        cell.textLabel?.numberOfLines = 0 // Permitir múltiples líneas en el texto
        
        return cell
    }
}
