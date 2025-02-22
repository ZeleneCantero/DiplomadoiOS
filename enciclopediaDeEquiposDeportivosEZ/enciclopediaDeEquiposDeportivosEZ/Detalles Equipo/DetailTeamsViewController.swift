//
//  DetailTeamsViewController.swift
//  enciclopediaDeEquiposDeportivosEZ
//
//  Created by Zelene Yosseline Isayana Montes Cantero on 15/12/24.
//

import UIKit

class DetailTeamsViewController: UIViewController {
    
    @IBAction func buttonCerrarSesion(_ sender: Any) {
        print("Entro, cierro sesion")
        navigationController?.popToRootViewController(animated: true)
    }
    
    //Array
    let arrayTeamsNFLlabel = ["Kansas City Chiefs", "Bufalo Bills", "Detroit Lions", "Washington Commanders", "Miami Dolphins"]
    let arrayTeamsNFL = ["Kansas City Chiefs", "Bufalo Bills", "Detroit Lions", "Washington Commanders", "Miami Dolphins"]

    var nextScreenPlayer: String = ""
    struct jugadores {
        var nombres: [String]
    }
    
    let arrayHistoryTeams = [
        """
        El equipo de la NFL de Kansas City, conocido como los Kansas City Chiefs, tiene una rica historia que se remonta a 1960, cuando fueron fundados originalmente como los Dallas Texans en la American Football League (AFL). El equipo fue creado por Lamar Hunt, quien también fue una figura clave en la fundación de la AFL. 

        En 1963, el equipo se trasladó a Kansas City y adoptó el nombre de Chiefs, en honor a la comunidad nativa americana de la región y como una referencia al líder del gobierno de la ciudad de Kansas City, el alcalde Chief (Jefe) Harold Roe Bartle. A lo largo de los años, los Chiefs han tenido grandes momentos en la historia de la NFL. Su mayor logro llegó en 1970, cuando el equipo ganó el Super Bowl IV al vencer a los Minnesota Vikings, siendo el primer título de Super Bowl para la franquicia. 

        Después de años de altibajos, los Chiefs resurgieron en la década de 2010, especialmente con la llegada del mariscal de campo Patrick Mahomes, quien ha sido un líder clave. Mahomes llevó a los Chiefs a ganar el Super Bowl LIV en 2020, derrotando a los San Francisco 49ers, y en 2023 lograron su tercer campeonato al vencer a los Philadelphia Eagles en el Super Bowl LVII.

        El equipo es reconocido por su apasionada base de aficionados, su legado en la NFL y su fuerte identidad, particularmente en la ciudad de Kansas City, donde el equipo es una de las principales fuentes de orgullo local.
        """,
        """
        Los Buffalo Bills son un equipo histórico de la NFL, fundado en 1960 como parte de la American Football League (AFL). El equipo se originó con el nombre de Buffalo Bills en honor al famoso vaquero y figura del oeste, Buffalo Bill Cody. Fue adquirido por Ralph Wilson, quien fue propietario del equipo durante más de 50 años. 

        A lo largo de su historia, los Bills se han destacado por su fortaleza en varias épocas. En la década de 1990, el equipo vivió uno de sus momentos más gloriosos bajo la dirección del entrenador Marv Levy y el mariscal de campo Jim Kelly, llegando a cuatro Super Bowls consecutivos entre 1990 y 1993, aunque no lograron ganar ninguno de esos títulos.

        A pesar de algunos altibajos en los años siguientes, los Bills siguen siendo una pieza fundamental en la historia de la NFL, con una base de seguidores leales, especialmente en Buffalo, Nueva York. El equipo también es conocido por su atmósfera vibrante y su famoso estadio, el Highmark Stadium, que es un lugar clave para los partidos y la cultura del equipo.
        """,
        """
        Los Detroit Lions son una franquicia histórica de la NFL, fundada en 1930 bajo el nombre de Portsmouth Spartans. En 1934, el equipo fue adquirido por un grupo de inversores de Detroit y cambió su nombre a Detroit Lions, en honor a la fuerte tradición deportiva de la ciudad, y al equipo de béisbol Detroit Tigers. 

        Los Lions fueron uno de los equipos originales de la NFL, y rápidamente se establecieron como un equipo competitivo. El equipo experimentó grandes éxitos en las décadas de 1950 y 1960, ganando cuatro campeonatos de la NFL (1952, 1953, 1957 y 1960). Sin embargo, en los años posteriores, los Lions enfrentaron dificultades para mantenerse en la cima, y aunque han tenido momentos de éxito en diversas temporadas, no han logrado ganar un Super Bowl.

        A pesar de no haber alcanzado muchos logros recientes, los Lions siguen siendo un equipo con una base de fanáticos apasionados, especialmente en la ciudad de Detroit. Han sido una parte importante de la cultura deportiva de la ciudad, y su estadio, el Ford Field, es un lugar emblemático para los seguidores de la NFL.
        """,
        """
        Los Washington Commanders, anteriormente conocidos como los Washington Redskins, son una franquicia de la NFL fundada en 1932. Originalmente, el equipo se estableció en Boston como los Boston Braves, pero cambió a los Boston Redskins poco después de su fundación. En 1937, el equipo se trasladó a Washington D.C., donde se mantuvo como los Washington Redskins durante varias décadas.

        Durante su historia, los Commanders han tenido periodos de éxito, incluyendo tres victorias en el Super Bowl (en 1982, 1987 y 1991), y han sido considerados uno de los equipos más exitosos de la NFL en esos años. Los jugadores legendarios como Joe Theismann, John Riggins y Darrell Green han sido parte fundamental de su legado.

        El equipo cambió su nombre a Washington Commanders en 2022, después de años de controversias sobre el uso del nombre Redskins, que era considerado ofensivo por muchos. Esta decisión fue parte de un esfuerzo por redefinir la identidad del equipo y mejorar la relación con diversas comunidades, incluidos los pueblos indígenas. Aunque los Commanders no han sido campeones en tiempos recientes, continúan siendo una de las franquicias más reconocidas de la NFL, con una base de seguidores leales y un legado histórico en la liga.
        """,
        """
        Los Miami Dolphins son una de las franquicias más emblemáticas de la NFL, fundados en 1966 como parte de la expansión de la liga. A lo largo de su historia, los Dolphins han tenido varios logros importantes, incluyendo dos títulos de Super Bowl, ganados en 1972 y 1973, siendo uno de los equipos más exitosos de las décadas de 1970. 

        En 1972, los Dolphins lograron una hazaña histórica al ser el único equipo en la historia de la NFL que completó una temporada invicta, ganando todos sus partidos, incluido el Super Bowl VII. Bajo la dirección de su entrenador Don Shula, quien estuvo al mando durante 26 años, los Dolphins se consolidaron como una de las mejores franquicias de la liga durante la segunda mitad del siglo XX. 

        Además de su éxito en los Super Bowls, el equipo ha tenido varias temporadas exitosas en playoffs a lo largo de los años. Con el paso de las décadas, los Dolphins han enfrentado altibajos, pero siguen siendo una franquicia con una gran base de seguidores en la ciudad de Miami y en todo el país. Jugadores legendarios como Dan Marino, uno de los mariscales de campo más destacados de la NFL, han dejado una marca indeleble en la historia del equipo.

        Aunque no han ganado un Super Bowl desde 1973, los Miami Dolphins siguen siendo una parte integral de la NFL, con un legado y una historia que continúa inspirando a nuevas generaciones de aficionados al fútbol americano.
        """
    ]

    
    // Define los detalles para cada Pokémon
    var listaDeJugadores: [String: jugadores] = [
        "Kansas City Chiefs": jugadores(nombres: [
        "Patrick Mahomes",
        "Travis Kelce",
        "Chris Jones",
        "JuJu Smith-Schuster",
        "Nick Bolton",
        "Clyde Edwards-Helaire",
        "Kadarius Toney",
        "Marquez Valdes-Scantling",
        "Frank Clark",
        "Orlando Brown Jr.",
        "Isiah Pacheco",
        "Jarran Reed",
        "L'Jarius Sneed",
        "Willie Gay Jr.",
        "Trey Smith",
        "JuJu Smith-Schuster",
        "Cameron Thomas",
        "Noah Gray",
        "Darius Harris",
        "Ronald Jones II",
        "Joshua Williams",
        "George Karlaftis" ]), //22
        
        "Bufalo Bills": jugadores(nombres: [
        "Josh Allen",
        "James Cook",
        "Dawson Knox",
        "Stefon Diggs",
        "Gabe Davis",
        "Derrick Henry",
        "Devin Singletary",
        "Quinton Morris",
        "Connor McGovern",
        "David Edwards",
        "Dion Dawkins",
        "Spencer Brown",
        "Greg Rousseau",
        "Von Miller",
        "Ed Oliver",
        "Matt Milano",
        "Taron Johnson",
        "Kaiir Elam",
        "Rasul Douglas",
        "Micah Hyde",
        "Jordan Poyer",
        "Sam Martin" //22
        ]),
        
        "Detroit Lions": jugadores(nombres: [
        "Aidan Hutchinson",
        "Penny Sewell",
        "Jared Goff",
        "David Montgomery",
        "Amon-Ra St. Brown",
        "Sam LaPorta",
        "Isaiah Buggs",
        "Josh Paschal",
        "Charles Harris",
        "Jack Campbell",
        "Jahmyr Gibbs",
        "Tracy Walker",
        "Khalif Raymond",
        "Cam Sutton",
        "C.J. Moore",
        "Dan Skipper",
        "Za'Darius Smith",
        "Colby Sorsdal",
        "Ezekiel Turner",
        "Sione Vaki",
        "Kindle Vildor",
        "Jameson Williams" //"22
        ]),
        
        "Washington Commanders": jugadores(nombres: [
        "Kazmeir Allen",
        "Dyami Brown",
        "Noah Brown",
        "Jamison Crowder",
        "Luke McCaffrey",
        "Terry McLaurin",
        "K.J. Osborn",
        "Mitchell Tinsley",
        "Brycen Tremayne",
        "Olamide Zaccheaus",
        "John Bates",
        "Zach Ertz",
        "Tyler Ott",
        "Ben Sinnott",
        "Cole Turner",
        "Colson Yankoff",
        "Nick Allegretti",
        "Sam Cosmi",
        "Michael Deiter",
        "Julian Good-Jones",
        "Chris Paul",
        "Andrew Wylie" // 22
            ]),
        
        "Miami Dolphins" : jugadores(nombres: [
        "Tyreek Hill",
        "Jaylen Waddle",
        "Tua Tagovailoa",
        "Jalen Ramsey",
        "De'Von Achane",
        "Raheem Mostert",
        "Xavien Howard",
        "Brandon Jones",
        "Terrell Edmunds",
        "Eli Apple",
        "Hunter Long",
        "Kader Kohou",
        "Khalil Shakir",
        "Chase Edmonds",
        "Mike Gesicki",
        "Tanner Conner",
        "Durham Smythe",
        "Zach Sieler",
        "Christian Wilkins",
        "Calais Campbell",
        "Matt Dickerson",
        "Neil Farrell"
            ])
    ]

    
    
    //Siguiente pagina
    var nextScreen: String = ""
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        print("INFORMACION MANDADA: \(nextScreen)")
        
//        //Collection View Cell
//        tableView.register(DetailTeamsCollectionViewCell.self, forCellReuseIdentifier: "collectionViewCell")
    }
}

extension DetailTeamsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 0
        case 1:
            return 22
        case 2:
            return 1
        default:
            return 1
        }
    }
    
    
    // Número de secciones
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3 // Equipos con la información
    }
    
    // Ponerle imagen al header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Crear la vista del encabezado
        let headerView = UIView()
        headerView.backgroundColor = .lightGray
        
        // Crear UIImageView para la imagen
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Crear UILabel para el texto
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        
        
        switch section {
        case 0: // Encabezado del equipo (nombre e imagen)
            switch nextScreen {
            case "Kansas City Chiefs":
                imageView.image = UIImage(named: "Kansas City Chiefs")
                label.text = "Kansas City Chiefs"
            case "Bufalo Bills":
                imageView.image = UIImage(named: "Bufalo Bills")
                label.text = "Buffalo Bills"
            case "Detroit Lions":
                imageView.image = UIImage(named: "Detroit Lions")
                label.text = "Detroit Lions"
            case "Washington Commanders":
                imageView.image = UIImage(named: "Washington Commanders")
                label.text = "Washington Commanders"
            case "Miami Dolphins":
                imageView.image = UIImage(named: "Miami Dolphins")
                label.text = "Miami Dolphins"
            default:
                imageView.image = nil
                label.text = "Equipo"
            }
        case 1: // Encabezado de la lista de jugadores
            imageView.image = nil
            label.text = "Lista de Jugadores"
            
            
        case 2: // Encabezado de la historia del equipo
            imageView.image = nil
            label.text = "Historia del Equipo"
        default:
            break
        }
        
        // Añadir subviews al headerView
        headerView.addSubview(imageView)
        headerView.addSubview(label)
        
        // Configurar restricciones para la imagen (solo en la primera sección)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            imageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Configurar restricciones para el texto
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 5),
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20)
        ])
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.section == 1 {
            cell.textLabel?.text = listaDeJugadores[nextScreen]?.nombres[indexPath.row]
            return cell
        } else if indexPath.section == 2 {
            switch nextScreen{
            case "Kansas City Chiefs": cell.textLabel?.text = arrayHistoryTeams[0]
            case "Bufalo Bills": cell.textLabel?.text = arrayHistoryTeams[1]
            case "Detroit Lions": cell.textLabel?.text = arrayHistoryTeams[2]
            case "Washington Commanders": cell.textLabel?.text = arrayHistoryTeams[3]
            case "Miami Dolphins": cell.textLabel?.text = arrayHistoryTeams[4]
            default: break
            }
            
            cell.textLabel?.numberOfLines = 0
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nextScreenPlayer = listaDeJugadores[nextScreen]?.nombres[indexPath.row] ?? ""
        print("TOCANDO", nextScreenPlayer)
        performSegue(withIdentifier: "nextScreenInformation", sender: nextScreenPlayer)
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 0
        case 1: return 20
        case 2: return 700
        default: return 0
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextScreenInformation" {
            if let destinationVC = segue.destination as? InformacionJugadorViewController {
                destinationVC.nextScreenPlayer = nextScreenPlayer
            }
        }
    }
    

}
