//
//  IngredientsTableViewController.swift
//  pizzaApp
//
//  Created by Diplomado on 25/01/25.
//

import UIKit

class IngredientsTableViewController: UIViewController {
    var pizzaData: PizzaData?
    var selectedIngredients: [String] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var addNewPizzaButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        var configuration = UIButton.Configuration.borderedProminent()
        configuration.title = "Agregar Nueva Pizza"
        button.configuration = configuration
        button.addTarget(self, action: #selector(addNewPizza), for: .touchUpInside)
        return button
    }()
    
    @objc private func addNewIngredient() {
        let alertController = UIAlertController(title: "Agregar Nuevo Ingrediente",
                                              message: nil,
                                              preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Nombre del nuevo ingrediente"
        }
        
        let okAction = UIAlertAction(title: "Aceptar", style: .default) { [weak self] _ in
            guard let self = self else { return }
            
            if let ingredientName = alertController.textFields?.first?.text,
               !ingredientName.isEmpty {
                
                // Verificar si el ingrediente ya existe
                if let existingIngredients = self.pizzaData?.ingredients,
                   existingIngredients.contains(ingredientName) {
                    self.showAlert(message: "Este ingrediente ya existe")
                    return
                }
                
                // Agregar el nuevo ingrediente
                self.pizzaData?.ingredients.append(ingredientName)
                
                // Guardar los datos actualizados
                self.savePizzaDataToJson()
                
                // Recargar la tabla
                self.tableView.reloadData()
                
            } else {
                self.showAlert(message: "Por favor ingrese un nombre para el ingrediente")
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func addNewPizza() {
        let alertController = UIAlertController(title: "Ingrese el Nombre de la Pizza",
                                              message: nil,
                                              preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Nombre de la Pizza"
        }
        
        let okAction = UIAlertAction(title: "Aceptar", style: .default) { [weak self] _ in
            guard let self = self else { return }
            
            if let pizzaName = alertController.textFields?.first?.text, !pizzaName.isEmpty {
                // Verificar si ya existe una pizza con ese nombre
                if let existingPizzas = self.pizzaData?.pizzas,
                   existingPizzas.contains(where: { $0.name == pizzaName }) {
                    self.showAlert(message: "Ya existe una pizza con ese nombre")
                    return
                }
                
                let newPizza = PizzaData.Pizzas(name: pizzaName, ingredients: self.selectedIngredients)
                self.pizzaData?.pizzas.append(newPizza)
                self.savePizzaDataToJson()
                
                // Limpiar selección y actualizar UI
                self.selectedIngredients.removeAll()
                self.tableView.reloadData()
                self.addNewPizzaButton.isHidden = true
                
                // Mostrar confirmación
                self.showAlert(message: "Pizza agregada exitosamente")
            } else {
                self.showAlert(message: "Por favor ingrese un nombre para la pizza")
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func savePizzaDataToJson() {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let jsonData = try encoder.encode(pizzaData)
            
            guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
                in: .userDomainMask).first else {
                return
            }
            
            let jsonFilePath = documentsDirectory.appendingPathComponent("pizza-info.json")
            
            try jsonData.write(to: jsonFilePath, options: .atomic)
            
            print("Archivo JSON guardado en: \(jsonFilePath)")
        } catch {
            print("Error al guardar los datos JSON: \(error)")
            showAlert(message: "Error al guardar los datos")
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Alerta", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGroupedBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Ingredientes"
        addNewPizzaButton.isHidden = true
        
        let addButton = UIBarButtonItem(title: "Nuevo Ingrediente",
                                      style: .plain,
                                      target: self,
                                      action: #selector(addNewIngredient))
        //let button = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(botonPresionado))

        navigationItem.rightBarButtonItem = addButton
        
        setupStackViews()
        loadJSONData()
    }
    
    private func setupStackViews() {
        mainStackView.addArrangedSubview(tableView)
        mainStackView.addArrangedSubview(addNewPizzaButton)
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150)
        ])
    }
    
    private func loadJSONData() {
        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
            in: .userDomainMask).first {
            let jsonFilePath = documentsDirectory.appendingPathComponent("pizza-info.json")
            
            do {
                let data = try Data(contentsOf: jsonFilePath)
                pizzaData = try JSONDecoder().decode(PizzaData.self, from: data)
                tableView.reloadData()
            } catch {
                // Si falla la carga desde documentos, intentar cargar desde el bundle
                if let bundlePath = Bundle.main.url(forResource: "pizza-info", withExtension: "json"),
                   let data = try? Data(contentsOf: bundlePath) {
                    pizzaData = try? JSONDecoder().decode(PizzaData.self, from: data)
                    tableView.reloadData()
                } else {
                    showAlert(message: "Error al cargar los datos")
                }
            }
        }
    }
}

extension IngredientsTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzaData?.ingredients.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let ingredient = pizzaData?.ingredients[indexPath.row] ?? ""
        cell.textLabel?.text = ingredient
        
        if selectedIngredients.contains(ingredient) {
            cell.backgroundColor = .green
        } else {
            cell.backgroundColor = .white
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let ingredient = pizzaData?.ingredients[indexPath.row] {
            if selectedIngredients.contains(ingredient) {
                if let index = selectedIngredients.firstIndex(of: ingredient) {
                    selectedIngredients.remove(at: index)
                }
            } else {
                selectedIngredients.append(ingredient)
            }
            
            tableView.reloadData()
            addNewPizzaButton.isHidden = selectedIngredients.isEmpty
        }
    }
}
