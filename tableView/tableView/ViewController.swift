//
//  ViewController.swift
//  tableView
//
//  Created by Diplomado on 22/11/24.
//

import UIKit

class ViewController: UIViewController {
    var tableArray = ["Manuel", "Emi", "Zelene", "Tazz", "Dory"]
    var tableArray2 = ["Sanchez", "Gil", "Cantero", "Montes", "Espinoza", "Mendoza"]
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Referencia al View controller
        tableView.dataSource = self
        
        
        //Estamos utizando referencia a la clase por eso el .self
        //celdas reutilizables
        //tableView.register (UITableViewCell.self, forCellReuseIdentifier: "cell")
        let xib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "cell")
      //  tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
}



extension ViewController: UITableViewDataSource{
    
    
    
    func numberOfSections(in tableView: UITableView, titleForHeaderInSection section: Int) -> String {
        if section == 0{
            return "Primero"
        }else{
            return "Segundo"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            tableArray.count
        }else{
            tableArray2.count
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        //Se garantiza que la celda siempre va a existir, si no exotse una entonces la crea
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell
        if indexPath.section == 0{
            cell?.cellTextLabel.text = tableArray[indexPath.row]
        }else{
            cell?.cellTextLabel.text = tableArray2[indexPath.row]
        }
        
        
//        if #available(iOS 14, *){
//            var content = cell?.defaultContentConfiguration()
//            content?.text = tableArray[indexPath.row]
//            content?.secondaryText = tableArray[indexPath.row]
//            cell?.contentConfiguration = content
//            
//        }else{
//            cell?.textLabel?.text = tableArray[indexPath.row]
//            //Como el subtitulo
//            cell?.detailTextLabel?.text = tableArray[indexPath.row]
//        }
        return cell ?? UITableViewCell()
    }
    
    
}
