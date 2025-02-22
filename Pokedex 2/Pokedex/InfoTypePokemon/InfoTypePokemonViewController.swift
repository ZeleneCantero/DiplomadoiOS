//
//  InfoTypePokemonViewController.swift
//  Pokedex
//
//  Created by Zelene Yosseline Isayana Montes Cantero on 07/12/24.
//

import UIKit

class InfoTypePokemonViewController: UIViewController {

    
    var arrayTypes = ["Fuego", "Agua", "Planta", "Electrico"]
    var arrayTypesNameImages = ["Fuego", "Agua", "Planta", "Electrico"]
    
    struct TypesPokemon {
        var tipo: String
        var dobleDañoAtipos: [String]
        var dobleDañoDe: [String]
        var mitadDeDañoATipos: [String]
        var mitadDeDañoDe: [String]
        var noLeAfectaAtipos: [String]
        var noLeHacenDaño: [String]
    }
    
    // Define los detalles para cada Pokémon
    var pokemonTypes: [String: TypesPokemon] = [
        "Fuego": TypesPokemon(tipo: "Fuego",
                              dobleDañoAtipos: ["Agua", "Roca", "Tierra"],
                              dobleDañoDe: ["Agua", "Roca"],
                              mitadDeDañoATipos: ["Fuego", "Hierba", "Hielo", "Bicho", "Acero", "Hada"],
                              mitadDeDañoDe: ["Fuego", "Hierba", "Hielo", "Acero", "Hada"],
                              noLeAfectaAtipos: ["Fuego", "Tierra", "Roca"],
                              noLeHacenDaño: ["Bicho", "Veneno", "Roca"]),
                              
  
        "Agua": TypesPokemon(tipo: "Agua",
                              dobleDañoAtipos: ["Fuego", "Tierra", "Roca"],
                              dobleDañoDe: ["Electrico", "Planta"],
                              mitadDeDañoATipos: ["Electrico", "Planta"],
                              mitadDeDañoDe: ["Fuego", "Tierra", "Roca"],
                              noLeAfectaAtipos: ["Fuego", "Tierra", "Roca"],
                              noLeHacenDaño: ["Bicho", "Veneno", "Roca"]),
        

            "Planta": TypesPokemon(tipo: "Planta",
                                  dobleDañoAtipos: ["Agua", "Tierra", "Roca"],
                                  dobleDañoDe: ["Fuego", "Volador", "Hielo"],
                                  mitadDeDañoATipos: ["Fuego", "Volador", "Hielo"],
                                  mitadDeDañoDe: ["Agua", "Tiejeras", "Roca"],
                                  noLeAfectaAtipos: ["Fuego", "Volador", "Hielo"],
                                  noLeHacenDaño: ["Bicho", "Veneno", "Siniestro"]),
        
        "Electrico": TypesPokemon(tipo: "Electrico",
                              dobleDañoAtipos: ["Agua", "Volador"],
                              dobleDañoDe: ["Tierra"],
                              mitadDeDañoATipos: ["Eléctrico", "Volador", "Acero"],
                              mitadDeDañoDe: ["Agua", "Eléctrico", "Planta"],
                              noLeAfectaAtipos: ["Tierra"],
                              noLeHacenDaño: ["Veneno"])
        ]
    
        
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var typeSelect: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        print("DESDE InfoTypePokemonViewController", typeSelect)
    }

}


extension InfoTypePokemonViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7 // Una sección para la información básica y otra para las evoluciones
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return pokemonTypes[typeSelect]?.dobleDañoAtipos.count ?? 0
        case 2:
            return pokemonTypes[typeSelect]?.dobleDañoDe.count ?? 0
            
        case 3:
            return pokemonTypes[typeSelect]?.mitadDeDañoATipos.count ?? 0
        case 4:
            return pokemonTypes[typeSelect]?.mitadDeDañoDe.count ?? 0
            
        case 5:
            return pokemonTypes[typeSelect]?.noLeAfectaAtipos.count ?? 0
            
        case 6:
            return pokemonTypes[typeSelect]?.noLeHacenDaño.count ?? 0
            
        default:
            return 0
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch indexPath.section {
        case 0: // tipo
            cell.textLabel?.text = typeSelect
            cell.imageView?.image = UIImage(named: typeSelect)

        case 1: //dobleDañoAtipos
            if let types = pokemonTypes[typeSelect]?.dobleDañoAtipos {
                let typesName = types[indexPath.row]
                cell.textLabel?.text = types[indexPath.row]
                cell.imageView?.image = UIImage(named: types[indexPath.row])
            }
            
        case 2: //dobleDañoDe
            if let types = pokemonTypes[typeSelect]?.dobleDañoDe {
                let typesName = types[indexPath.row]
                cell.textLabel?.text = types[indexPath.row]
                cell.imageView?.image = UIImage(named: types[indexPath.row])
            }
            
        case 3: //mitadDeDañoATipos
            if let types = pokemonTypes[typeSelect]?.mitadDeDañoATipos {
                let typesName = types[indexPath.row]
                cell.textLabel?.text = types[indexPath.row]
                cell.imageView?.image = UIImage(named: types[indexPath.row])
            }
        case 4: //mitadDeDañoDe
            if let types = pokemonTypes[typeSelect]?.mitadDeDañoDe {
                let typesName = types[indexPath.row]
                cell.textLabel?.text = types[indexPath.row]
                cell.imageView?.image = UIImage(named: types[indexPath.row])
            }
            
        case 5: //noLeAfectaAtipos
            if let types = pokemonTypes[typeSelect]?.noLeAfectaAtipos {
                let typesName = types[indexPath.row]
                cell.textLabel?.text = types[indexPath.row]
                cell.imageView?.image = UIImage(named: types[indexPath.row])
            }
            
        case 6: //noLeHacenDaño
            if let types = pokemonTypes[typeSelect]?.noLeHacenDaño {
                let typesName = types[indexPath.row]
                cell.textLabel?.text = types[indexPath.row]
                cell.imageView?.image = UIImage(named: types[indexPath.row])
            }
        default:
            print()
        }
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Tipo"
        case 1:
            return "Doble daño a tipos"
        case 2:
            return "Doble daño de"
        case 3:
            return "Mitad de daño a tipos"
        case 4:
            return "Mitad de daño de"
        case 5:
            return "No le afecto a tipos"
        case 6:
            return "No le hacen daño"
        default:
            return nil
        }
    }
}
