//
//  ViewController.swift
//  netflix
//
//  Created by Zelene Yosseline Isayana Montes Cantero on 01/12/24.
//
//Películas Desarrolla una aplicación al estilo de Netflix que muestre múltiples películas organizadas por género. La aplicación debe permitir desplazamiento vertical para explorar al menos tres categorías de películas, y dentro de cada categoría, debería haber desplazamiento horizontal para ver al menos tres películas.
//
//Nota Para este ejercicio, debes crear una tabla donde cada celda contenga un Collection View.


import UIKit

class ViewController: UIViewController {

    
    //Arreglos
    var arrayCategory = ["Amor","Terror","Psicologicas","Suspenso"]
    //Tabla
    private let tableView: UITableView = {
        var tableView = UITableView(frame: .zero, style: .grouped) // grouped para que se vean separaciones horizontales entre cada seccion
        tableView.backgroundColor = UIColor(red: 1.0, green: 0.85, blue: 0.85, alpha: 1.0)
        tableView.register(CollectionMoviesTableViewCell.self , forCellReuseIdentifier: CollectionMoviesTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 1.0, green: 0.85, blue: 0.85, alpha: 1.0)
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
        
        //El encabezado
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 100))
        let label = UILabel(frame: CGRect(x: 150, y: 0, width: 100, height: 100))
        label.text = "Zelflix"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        label.textColor = UIColor(red: 0.7, green: 0.8, blue: 1.0, alpha: 1.0)
        headerView.addSubview(label)
        
        // Asignar la vista del encabezado a la tabla
        tableView.tableHeaderView = headerView
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }


}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayCategory.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //Para poner los titulos
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrayCategory[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionMoviesTableViewCell.identifier, for: indexPath) as? CollectionMoviesTableViewCell else {
            return UITableViewCell()
        }
        
        // Configurar la celda con la categoría correspondiente
        cell.configure(with: indexPath.section)
        cell.backgroundColor = UIColor(red: 0.678, green: 0.847, blue: 0.902, alpha: 1.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

