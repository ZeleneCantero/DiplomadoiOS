import UIKit

class InformationPokemonViewController: UIViewController {
    
    var arrayPokemones = ["Bulbasaur", "Charmander", "Squirtle", "Bellsprout", "Tentacool", "Seel", "Lickitung", "Horsea", "Magikarp", "Lapras"]
    var arrayPokemonesNum = ["0001", "0004", "0007", "0069", "0072", "0086", "0108", "0116", "0129", "0131"]
    
    struct PokemonDetail {
        var name: String
        var number: String
        var description: String
        var type: [String]
        var imageType: [String]
        var evolution: [String]
        var imageEvolution: [String]
    }
    
    // Define los detalles para cada Pokémon
    var pokemonDetails: [String: PokemonDetail] = [
        "Bulbasaur": PokemonDetail(name: "Bulbasaur",
                                   number: "0001",
                                   description: "Tras nacer, crece alimentándose durante un tiempo de los nutrientes que contiene el bulbo de su lomo.",
                                   type: ["Planta", "Veneno"],
                                   imageType: ["Planta", "Veneno"],
                                   evolution: ["Ivysaur", "Venusaur"],
                                   imageEvolution: ["Ivysaur", "Venusaur"]),
        
        "Charmander": PokemonDetail(name: "Charmander",
                                    number: "0004",
                                    description: "La llama de su cola indica su fuerza vital. Si está débil, la llama arderá más tenue.",
                                    type: ["Fuego"],
                                    imageType: ["Fuego"],
                                    evolution: ["Charmeleon", "Charizard"],
                                    imageEvolution: ["Charmeleon", "Charizard"]),
        
        "Squirtle": PokemonDetail(name: "Squirtle",
                                  number: "0007",
                                  description: "Tras nacer, se le hincha el lomo y se le forma un caparazón. Escupe poderosa espuma por la boca.",
                                  type: ["Agua"],
                                  imageType: ["Agua"],
                                  evolution: ["Wartortle", "Blastoise"],
                                  imageEvolution: ["Wartortle", "Blastoise"]),
        
        "Bellsprout": PokemonDetail(name: "Bellsprout",
                                    number: "0069",
                                    description: "Si detecta algún movimiento a su alrededor, sea cuando sea, reacciona enseguida extendiendo sus finas lianas en esa dirección.",
                                    type: ["Planta", "Veneno"],
                                    imageType: ["Planta", "Veneno"],
                                    evolution: ["Weepinbell", "Victreebel"],
                                    imageEvolution: ["Weepinbell", "Victreebel"]),
        
        "Tentacool": PokemonDetail(name: "Tentacool",
                                   number: "0072",
                                   description: "Cuando baja la marea, se pueden encontrar Tentacool deshidratados junto a la orilla.",
                                   type: ["Agua", "Veneno"],
                                   imageType: ["Agua", "Veneno"],
                                   evolution: ["Tentacruel"],
                                   imageEvolution: ["Tentacruel"]),
        
        "Seel": PokemonDetail(name: "Seel",
                              number: "0086",
                              description: "La protuberancia que tiene en la cabeza es tan dura que la usa para abrirse paso a cabezazos por el hielo de los icebergs.",
                              type: ["Agua"],
                              imageType: ["Agua"],
                              evolution: ["Dewgong"],
                              imageEvolution: ["Dewgong"]),
        
        "Lickitung": PokemonDetail(name: "Lickitung",
                                   number: "0108",
                                   description: "Si sus lametones no se tratan a tiempo, su saliva pegajosa y urticante puede provocar picores persistentes.",
                                   type: ["Normal"],
                                   imageType: ["Normal"],
                                   evolution: ["Lickilicky"],
                                   imageEvolution: ["Lickilicky"]),
        
        "Horsea": PokemonDetail(name: "Horsea",
                                number: "0116",
                                description: "Si es atacado por un enemigo, por muy grande que sea, nada veloz a un lugar seguro gracias a su fornida aleta dorsal.",
                                type: ["Agua"],
                                imageType: ["Agua"],
                                evolution: ["Seadra", "Kingdra"],
                                imageEvolution: ["Seadra", "Kingdra"]),
        
        "Magikarp": PokemonDetail(name: "Magikarp",
                                  number: "0129",
                                  description: "Un Pokémon desvalido y patético. A veces es capaz de saltar alto, pero rara vez más de 2 m.",
                                  type: ["Agua"],
                                  imageType: ["Agua"],
                                  evolution: ["Gyarados"],
                                  imageEvolution: ["Gyarados"]),
        
        "Lapras": PokemonDetail(name: "Lapras",
                                number: "0131",
                                description: "Un Pokémon desvalido y patético. A veces es capaz de saltar alto, pero rara vez más de 2 m.",
                                type: ["Agua"],
                                imageType: ["Agua"],
                                evolution: ["Este Pokémon no evoluciona"],
                                imageEvolution: [""])
    ]
    
    var selectedPokemon: String = ""
    
    @IBOutlet weak var imagePokemon: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        print("POKEMON desde InformationPokemonViewController ", selectedPokemon)
    }
}

extension InformationPokemonViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5 // Una sección para la información básica y otra para las evoluciones
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1 // Nombre del Pokémon
        case 1:
            return 1 // Número del Pokémon
        case 2:
            return 1 // Descripción del Pokémon
        case 3:
            return pokemonDetails[selectedPokemon]?.type.count ?? 0 // Tipos del Pokémon
        case 4:
            return pokemonDetails[selectedPokemon]?.evolution.count ?? 0 // Evoluciones del Pokémon
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch indexPath.section {
        case 0:
            imagePokemon.image = UIImage(named: selectedPokemon)
            cell.textLabel?.text = selectedPokemon
        case 1:
            cell.textLabel?.text = pokemonDetails[selectedPokemon]?.number
        case 2:
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = pokemonDetails[selectedPokemon]?.description
        case 3:
            if let types = pokemonDetails[selectedPokemon]?.type {
                let typesName = types[indexPath.row]
                cell.textLabel?.text = types[indexPath.row]
                cell.imageView?.image = UIImage(named: types[indexPath.row])
            }
        case 4:
            if let evolutionNames = pokemonDetails[selectedPokemon]?.evolution {
                let evolutionName = evolutionNames[indexPath.row]
                cell.textLabel?.text = evolutionName
                cell.imageView?.image = UIImage(named: evolutionNames[indexPath.row])
            } else {
                // Manejar el caso donde no hay información de evolución disponible
                print("No hay información de evolución para \(selectedPokemon)")
            }

        default:
            cell.textLabel?.text = "N/A"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Nombre"
        case 1:
            return "Número"
        case 2:
            return "Descripción"
        case 3:
            return "Tipo(s)"
        case 4:
            return "Evoluciones"
        default:
            return nil
        }
    }
}
