//
//  PizzaDetailViewModel.swift
//  pizzaApp
//
//  Created by Diplomado on 25/01/25.
//

import UIKit
import Lottie

class PizzaDetailViewController: UIViewController, UITableViewDataSource {
    
    var pizza: PizzaData.Pizzas
    
    var animationView: LottieAnimationView!
    var ingredientsTableView: UITableView!
    
    lazy var labelNamePizza: UILabel = {
        var labelPizza = UILabel()
        labelPizza.text = pizza.name
        labelPizza.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        labelPizza.translatesAutoresizingMaskIntoConstraints = false
        return labelPizza
    }()
    
    init(pizza: PizzaData.Pizzas) {
        self.pizza = pizza
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGroupedBackground
        setupAnimation()
        setupIngredientsTableView()
        addLabelNamePizza()
    }
    

    func setupAnimation() { // Configuración y adición de la primera animación (animationView)
        animationView = LottieAnimationView(name: "pizzaAnimation")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(animationView)
        animationView.play()
        
        // Activación de constraints para animationView (la primera animación)
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.widthAnchor.constraint(equalToConstant: 300),
            animationView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }

    
    func addLabelNamePizza() {
        view.addSubview(labelNamePizza)
        
        NSLayoutConstraint.activate([
            labelNamePizza.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -50),
            labelNamePizza.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
    }


    func setupIngredientsTableView() {
        ingredientsTableView = UITableView(frame: .zero, style: .insetGrouped)
        ingredientsTableView.translatesAutoresizingMaskIntoConstraints = false
        ingredientsTableView.dataSource = self
        ingredientsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "ingredientCell")
        
        view.addSubview(ingredientsTableView)
        
        NSLayoutConstraint.activate([
            ingredientsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            ingredientsTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            ingredientsTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            ingredientsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizza.ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath)
        
        let ingredient = pizza.ingredients[indexPath.row]
        cell.textLabel?.text = ingredient
//        cell.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        return cell
    }
}
