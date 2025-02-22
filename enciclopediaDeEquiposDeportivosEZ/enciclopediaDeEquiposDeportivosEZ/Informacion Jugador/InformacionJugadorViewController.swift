//
//  InformacionJugadorViewController.swift
//  enciclopediaDeEquiposDeportivosEZ
//
//  Created by Zelene Yosseline Isayana Montes Cantero on 15/12/24.
//

import UIKit

class InformacionJugadorViewController: UIViewController {

    var nextScreenPlayer: String = ""
    
    struct Player {
        var nombre: String
        var numero: String
        var posicion: String
        var estadisticas: String
    }

    var arrayPlayers: [String: Player] = [
        
        //KANSAS
        "Patrick Mahomes": Player(nombre: "Patrick Mahomes", numero: "15", posicion: "Quarterback", estadisticas: "Pases: 455, Yardas: 4800, Touchdowns: 38, Intercepciones: 6"),
            "Travis Kelce": Player(nombre: "Travis Kelce", numero: "87", posicion: "Tight End", estadisticas: "Recepciones: 75, Yardas: 950, Touchdowns: 12"),
            "Chris Jones": Player(nombre: "Chris Jones", numero: "95", posicion: "Defensive Tackle", estadisticas: "Sacks: 15.5, Tackles: 35"),
            "JuJu Smith-Schuster": Player(nombre: "JuJu Smith-Schuster", numero: "9", posicion: "Wide Receiver", estadisticas: "Recepciones: 50, Yardas: 800, Touchdowns: 6"),
            "Nick Bolton": Player(nombre: "Nick Bolton", numero: "32", posicion: "Linebacker", estadisticas: "Tackles: 130, Intercepciones: 1"),
            "Clyde Edwards-Helaire": Player(nombre: "Clyde Edwards-Helaire", numero: "25", posicion: "Running Back", estadisticas: "Carreras: 150, Yardas: 700, Touchdowns: 5"),
            "Kadarius Toney": Player(nombre: "Kadarius Toney", numero: "19", posicion: "Wide Receiver", estadisticas: "Recepciones: 35, Yardas: 450, Touchdowns: 3"),
            "Marquez Valdes-Scantling": Player(nombre: "Marquez Valdes-Scantling", numero: "11", posicion: "Wide Receiver", estadisticas: "Recepciones: 40, Yardas: 650, Touchdowns: 4"),
            "Frank Clark": Player(nombre: "Frank Clark", numero: "55", posicion: "Defensive End", estadisticas: "Sacks: 9, Tackles: 25"),
            "Orlando Brown Jr.": Player(nombre: "Orlando Brown Jr.", numero: "57", posicion: "Offensive Tackle", estadisticas: "Sacks permitidos: 3"),
            "Isiah Pacheco": Player(nombre: "Isiah Pacheco", numero: "10", posicion: "Running", estadisticas: "Recepciones: 85, Yardas: 1350, Touchdowns: 10"),
            "Jarran Reed": Player(nombre: "Jarran Reed", numero: "90", posicion: "Defensive Tackle", estadisticas: "Sacks: 5, Tackles: 20"),
            "L'Jarius Sneed": Player(nombre: "L'Jarius Sneed", numero: "38", posicion: "Cornerback", estadisticas: "Intercepciones: 3, Tackles: 65"),
            "Willie Gay Jr.": Player(nombre: "Willie Gay Jr.", numero: "50", posicion: "Linebacker", estadisticas: "Tackles: 105, Intercepciones: 1"),
            "Trey Smith": Player(nombre: "Trey Smith", numero: "65", posicion: "Offensive Guard", estadisticas: "Sacks permitidos: 2"),
            "Cameron Thomas": Player(nombre: "Cameron Thomas", numero: "97", posicion: "Defensive End", estadisticas: "Sacks: 3, Tackles: 15"),
            "Noah Gray": Player(nombre: "Noah Gray", numero: "83", posicion: "Tight End", estadisticas: "Recepciones: 25, Yardas: 300, Touchdowns: 2"),
            "Darius Harris": Player(nombre: "Darius Harris", numero: "58", posicion: "Linebacker", estadisticas: "Tackles: 80, Intercepciones: 0"),
            "Ronald Jones II": Player(nombre: "Ronald Jones II", numero: "27", posicion: "Running Back", estadisticas: "Carreras: 120, Yardas: 550, Touchdowns: 4"),
            "Joshua Williams": Player(nombre: "Joshua Williams", numero: "23", posicion: "Cornerback", estadisticas: "Intercepciones: 2, Tackles: 50"),
            "George Karlaftis": Player(nombre: "George Karlaftis", numero: "56", posicion: "Defensive End", estadisticas: "Sacks: 7, Tackles: 30"),
        
        
        //BUFALO
        "Josh Allen": Player(nombre: "Josh Allen", numero: "17", posicion: "Quarterback", estadisticas: "Pases: 420, Yardas: 4500, Touchdowns: 35, Intercepciones: 7"),
           "James Cook": Player(nombre: "James Cook", numero: "28", posicion: "Running Back", estadisticas: "Carreras: 200, Yardas: 850, Touchdowns: 7"),
           "Dawson Knox": Player(nombre: "Dawson Knox", numero: "88", posicion: "Tight End", estadisticas: "Recepciones: 40, Yardas: 500, Touchdowns: 4"),
           "Stefon Diggs": Player(nombre: "Stefon Diggs", numero: "14", posicion: "Wide Receiver", estadisticas: "Recepciones: 105, Yardas: 1400, Touchdowns: 9"),
           "Gabe Davis": Player(nombre: "Gabe Davis", numero: "13", posicion: "Wide Receiver", estadisticas: "Recepciones: 50, Yardas: 800, Touchdowns: 5"),
           "Derrick Henry": Player(nombre: "Derrick Henry", numero: "22", posicion: "Running Back", estadisticas: "Carreras: 250, Yardas: 1400, Touchdowns: 15"),
           "Devin Singletary": Player(nombre: "Devin Singletary", numero: "26", posicion: "Running Back", estadisticas: "Carreras: 180, Yardas: 650, Touchdowns: 4"),
           "Quinton Morris": Player(nombre: "Quinton Morris", numero: "81", posicion: "Tight End", estadisticas: "Recepciones: 10, Yardas: 150, Touchdowns: 1"),
           "Connor McGovern": Player(nombre: "Connor McGovern", numero: "60", posicion: "Offensive Guard", estadisticas: "Sacks permitidos: 2"),
           "David Edwards": Player(nombre: "David Edwards", numero: "79", posicion: "Offensive Guard", estadisticas: "Sacks permitidos: 3"),
           "Dion Dawkins": Player(nombre: "Dion Dawkins", numero: "73", posicion: "Offensive Tackle", estadisticas: "Sacks permitidos: 4"),
           "Spencer Brown": Player(nombre: "Spencer Brown", numero: "79", posicion: "Offensive Tackle", estadisticas: "Sacks permitidos: 3"),
           "Greg Rousseau": Player(nombre: "Greg Rousseau", numero: "50", posicion: "Defensive End", estadisticas: "Sacks: 8, Tackles: 40"),
           "Von Miller": Player(nombre: "Von Miller", numero: "40", posicion: "Linebacker", estadisticas: "Sacks: 10, Tackles: 45"),
           "Ed Oliver": Player(nombre: "Ed Oliver", numero: "91", posicion: "Defensive Tackle", estadisticas: "Sacks: 5, Tackles: 25"),
           "Matt Milano": Player(nombre: "Matt Milano", numero: "58", posicion: "Linebacker", estadisticas: "Tackles: 115, Intercepciones: 2"),
           "Taron Johnson": Player(nombre: "Taron Johnson", numero: "24", posicion: "Cornerback", estadisticas: "Intercepciones: 4, Tackles: 60"),
           "Kaiir Elam": Player(nombre: "Kaiir Elam", numero: "24", posicion: "Cornerback", estadisticas: "Intercepciones: 1, Tackles: 45"),
           "Rasul Douglas": Player(nombre: "Rasul Douglas", numero: "23", posicion: "Cornerback", estadisticas: "Intercepciones: 3, Tackles: 50"),
           "Micah Hyde": Player(nombre: "Micah Hyde", numero: "23", posicion: "Safety", estadisticas: "Intercepciones: 3, Tackles: 65"),
           "Jordan Poyer": Player(nombre: "Jordan Poyer", numero: "21", posicion: "Safety", estadisticas: "Intercepciones: 5, Tackles: 70"),
           "Sam Martin": Player(nombre: "Sam Martin", numero: "6", posicion: "Punter", estadisticas: "Promedio de pateo: 45.0 yardas"),
        
        //LIONS
        "Aidan Hutchinson": Player(nombre: "Aidan Hutchinson", numero: "97", posicion: "Defensive End", estadisticas: "Sacks: 10, Tackles: 60"),
           "Penny Sewell": Player(nombre: "Penny Sewell", numero: "58", posicion: "Offensive Tackle", estadisticas: "Sacks permitidos: 3"),
           "Jared Goff": Player(nombre: "Jared Goff", numero: "16", posicion: "Quarterback", estadisticas: "Pases: 440, Yardas: 4500, Touchdowns: 30, Intercepciones: 7"),
           "David Montgomery": Player(nombre: "David Montgomery", numero: "5", posicion: "Running Back", estadisticas: "Carreras: 210, Yardas: 950, Touchdowns: 8"),
           "Amon-Ra St. Brown": Player(nombre: "Amon-Ra St. Brown", numero: "14", posicion: "Wide Receiver", estadisticas: "Recepciones: 100, Yardas: 1100, Touchdowns: 8"),
           "Sam LaPorta": Player(nombre: "Sam LaPorta", numero: "87", posicion: "Tight End", estadisticas: "Recepciones: 40, Yardas: 500, Touchdowns: 5"),
           "Isaiah Buggs": Player(nombre: "Isaiah Buggs", numero: "90", posicion: "Defensive Tackle", estadisticas: "Sacks: 4, Tackles: 40"),
           "Josh Paschal": Player(nombre: "Josh Paschal", numero: "93", posicion: "Defensive End", estadisticas: "Sacks: 6, Tackles: 35"),
           "Charles Harris": Player(nombre: "Charles Harris", numero: "53", posicion: "Defensive End", estadisticas: "Sacks: 7, Tackles: 40"),
           "Jack Campbell": Player(nombre: "Jack Campbell", numero: "51", posicion: "Linebacker", estadisticas: "Tackles: 120, Intercepciones: 1"),
           "Jahmyr Gibbs": Player(nombre: "Jahmyr Gibbs", numero: "26", posicion: "Running Back", estadisticas: "Carreras: 180, Yardas: 750, Touchdowns: 6"),
           "Tracy Walker": Player(nombre: "Tracy Walker", numero: "21", posicion: "Safety", estadisticas: "Intercepciones: 3, Tackles: 50"),
           "Khalif Raymond": Player(nombre: "Khalif Raymond", numero: "11", posicion: "Wide Receiver", estadisticas: "Recepciones: 30, Yardas: 400, Touchdowns: 2"),
           "Cam Sutton": Player(nombre: "Cam Sutton", numero: "30", posicion: "Cornerback", estadisticas: "Intercepciones: 2, Tackles: 55"),
           "C.J. Moore": Player(nombre: "C.J. Moore", numero: "33", posicion: "Safety", estadisticas: "Intercepciones: 2, Tackles: 40"),
           "Dan Skipper": Player(nombre: "Dan Skipper", numero: "63", posicion: "Offensive Tackle", estadisticas: "Sacks permitidos: 4"),
           "Za'Darius Smith": Player(nombre: "Za'Darius Smith", numero: "55", posicion: "Outside Linebacker", estadisticas: "Sacks: 12, Tackles: 60"),
           "Colby Sorsdal": Player(nombre: "Colby Sorsdal", numero: "77", posicion: "Offensive Tackle", estadisticas: "Sacks permitidos: 2"),
           "Ezekiel Turner": Player(nombre: "Ezekiel Turner", numero: "53", posicion: "Linebacker", estadisticas: "Tackles: 45, Intercepciones: 1"),
           "Sione Vaki": Player(nombre: "Sione Vaki", numero: "20", posicion: "Safety", estadisticas: "Intercepciones: 1, Tackles: 50"),
           "Kindle Vildor": Player(nombre: "Kindle Vildor", numero: "24", posicion: "Cornerback", estadisticas: "Intercepciones: 2, Tackles: 35"),
           "Jameson Williams": Player(nombre: "Jameson Williams", numero: "9", posicion: "Wide Receiver", estadisticas: "Recepciones: 25, Yardas: 450, Touchdowns: 3"),
        
        //COMMANDERS
        "Kazmeir Allen": Player(nombre: "Kazmeir Allen", numero: "2", posicion: "Wide Receiver", estadisticas: "Recepciones: 20, Yardas: 250, Touchdowns: 2"),
            "Dyami Brown": Player(nombre: "Dyami Brown", numero: "2", posicion: "Wide Receiver", estadisticas: "Recepciones: 30, Yardas: 500, Touchdowns: 3"),
            "Noah Brown": Player(nombre: "Noah Brown", numero: "81", posicion: "Wide Receiver", estadisticas: "Recepciones: 25, Yardas: 350, Touchdowns: 2"),
            "Jamison Crowder": Player(nombre: "Jamison Crowder", numero: "80", posicion: "Wide Receiver", estadisticas: "Recepciones: 45, Yardas: 600, Touchdowns: 5"),
            "Luke McCaffrey": Player(nombre: "Luke McCaffrey", numero: "13", posicion: "Wide Receiver", estadisticas: "Recepciones: 10, Yardas: 150, Touchdowns: 1"),
            "Terry McLaurin": Player(nombre: "Terry McLaurin", numero: "17", posicion: "Wide Receiver", estadisticas: "Recepciones: 90, Yardas: 1200, Touchdowns: 8"),
            "K.J. Osborn": Player(nombre: "K.J. Osborn", numero: "17", posicion: "Wide Receiver", estadisticas: "Recepciones: 40, Yardas: 550, Touchdowns: 4"),
            "Mitchell Tinsley": Player(nombre: "Mitchell Tinsley", numero: "19", posicion: "Wide Receiver", estadisticas: "Recepciones: 15, Yardas: 200, Touchdowns: 2"),
            "Brycen Tremayne": Player(nombre: "Brycen Tremayne", numero: "10", posicion: "Wide Receiver", estadisticas: "Recepciones: 5, Yardas: 60, Touchdowns: 0"),
            "Olamide Zaccheaus": Player(nombre: "Olamide Zaccheaus", numero: "14", posicion: "Wide Receiver", estadisticas: "Recepciones: 30, Yardas: 450, Touchdowns: 4"),
            "John Bates": Player(nombre: "John Bates", numero: "87", posicion: "Tight End", estadisticas: "Recepciones: 20, Yardas: 250, Touchdowns: 1"),
            "Zach Ertz": Player(nombre: "Zach Ertz", numero: "86", posicion: "Tight End", estadisticas: "Recepciones: 50, Yardas: 600, Touchdowns: 5"),
            "Tyler Ott": Player(nombre: "Tyler Ott", numero: "44", posicion: "Long Snapper", estadisticas: "No aplica"),
            "Ben Sinnott": Player(nombre: "Ben Sinnott", numero: "86", posicion: "Tight End", estadisticas: "Recepciones: 10, Yardas: 100, Touchdowns: 1"),
            "Cole Turner": Player(nombre: "Cole Turner", numero: "40", posicion: "Tight End", estadisticas: "Recepciones: 15, Yardas: 180, Touchdowns: 2"),
            "Colson Yankoff": Player(nombre: "Colson Yankoff", numero: "45", posicion: "Wide Receiver", estadisticas: "Recepciones: 12, Yardas: 150, Touchdowns: 1"),
            "Nick Allegretti": Player(nombre: "Nick Allegretti", numero: "73", posicion: "Guard", estadisticas: "Sacks permitidos: 1"),
            "Sam Cosmi": Player(nombre: "Sam Cosmi", numero: "76", posicion: "Offensive Tackle", estadisticas: "Sacks permitidos: 2"),
            "Michael Deiter": Player(nombre: "Michael Deiter", numero: "63", posicion: "Center", estadisticas: "Sacks permitidos: 0"),
            "Julian Good-Jones": Player(nombre: "Julian Good-Jones", numero: "77", posicion: "Guard", estadisticas: "Sacks permitidos: 1"),
            "Chris Paul": Player(nombre: "Chris Paul", numero: "65", posicion: "Offensive Guard", estadisticas: "Sacks permitidos: 2"),
            "Andrew Wylie": Player(nombre: "Andrew Wylie", numero: "77", posicion: "Offensive Tackle", estadisticas: "Sacks permitidos: 3"),
        
        //DOLPHINS
        "Tyreek Hill": Player(nombre: "Tyreek Hill", numero: "10", posicion: "Wide Receiver", estadisticas: "Recepciones: 100, Yardas: 1500, Touchdowns: 12"),
            "Jaylen Waddle": Player(nombre: "Jaylen Waddle", numero: "17", posicion: "Wide Receiver", estadisticas: "Recepciones: 75, Yardas: 1200, Touchdowns: 8"),
            "Tua Tagovailoa": Player(nombre: "Tua Tagovailoa", numero: "1", posicion: "Quarterback", estadisticas: "Pases: 400, Yardas: 4500, Touchdowns: 30, Intercepciones: 7"),
            "Jalen Ramsey": Player(nombre: "Jalen Ramsey", numero: "5", posicion: "Cornerback", estadisticas: "Intercepciones: 4, Tackles: 40"),
            "De'Von Achane": Player(nombre: "De'Von Achane", numero: "28", posicion: "Running Back", estadisticas: "Yardas: 750, Touchdowns: 5"),
            "Raheem Mostert": Player(nombre: "Raheem Mostert", numero: "31", posicion: "Running Back", estadisticas: "Yardas: 1000, Touchdowns: 8"),
            "Xavien Howard": Player(nombre: "Xavien Howard", numero: "25", posicion: "Cornerback", estadisticas: "Intercepciones: 5, Tackles: 50"),
            "Brandon Jones": Player(nombre: "Brandon Jones", numero: "29", posicion: "Safety", estadisticas: "Tackles: 75, Intercepciones: 1"),
            "Terrell Edmunds": Player(nombre: "Terrell Edmunds", numero: "29", posicion: "Safety", estadisticas: "Tackles: 70, Intercepciones: 2"),
            "Eli Apple": Player(nombre: "Eli Apple", numero: "33", posicion: "Cornerback", estadisticas: "Intercepciones: 2, Tackles: 30"),
            "Hunter Long": Player(nombre: "Hunter Long", numero: "84", posicion: "Tight End", estadisticas: "Recepciones: 10, Yardas: 150, Touchdowns: 1"),
            "Kader Kohou": Player(nombre: "Kader Kohou", numero: "27", posicion: "Cornerback", estadisticas: "Tackles: 20, Intercepciones: 1"),
            "Khalil Shakir": Player(nombre: "Khalil Shakir", numero: "11", posicion: "Wide Receiver", estadisticas: "Recepciones: 25, Yardas: 350, Touchdowns: 3"),
            "Chase Edmonds": Player(nombre: "Chase Edmonds", numero: "2", posicion: "Running Back", estadisticas: "Yardas: 400, Touchdowns: 4"),
            "Mike Gesicki": Player(nombre: "Mike Gesicki", numero: "88", posicion: "Tight End", estadisticas: "Recepciones: 40, Yardas: 500, Touchdowns: 4"),
            "Tanner Conner": Player(nombre: "Tanner Conner", numero: "89", posicion: "Tight End", estadisticas: "Recepciones: 10, Yardas: 80, Touchdowns: 1"),
            "Durham Smythe": Player(nombre: "Durham Smythe", numero: "81", posicion: "Tight End", estadisticas: "Recepciones: 20, Yardas: 250, Touchdowns: 2"),
            "Zach Sieler": Player(nombre: "Zach Sieler", numero: "92", posicion: "Defensive Tackle", estadisticas: "Sacks: 5, Tackles: 40"),
            "Christian Wilkins": Player(nombre: "Christian Wilkins", numero: "94", posicion: "Defensive Tackle", estadisticas: "Sacks: 6, Tackles: 45"),
            "Calais Campbell": Player(nombre: "Calais Campbell", numero: "93", posicion: "Defensive End", estadisticas: "Sacks: 7, Tackles: 50"),
            "Matt Dickerson": Player(nombre: "Matt Dickerson", numero: "94", posicion: "Defensive End", estadisticas: "Sacks: 3, Tackles: 30"),
            "Neil Farrell": Player(nombre: "Neil Farrell", numero: "95", posicion: "Defensive Tackle", estadisticas: "Sacks: 2, Tackles: 25")
        ]

    
    //Tabla
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        print("JUGADOR", nextScreenPlayer)
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}


extension InformacionJugadorViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Número de secciones
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .lightGray
        // Crear UILabel para el texto
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        
        switch section {
        case 0: label.text = "Nombre del jugador"
        case 1: label.text = "Imagen del jugador"
        case 2: label.text = "Número del jugador"
        case 3: label.text = "Posición en el equipo"
        case 4: label.text = "Estadísticas relevantes (goles, asistencias, etc.)."
        default: label.text = ""
        }
        headerView.addSubview(label)
        

        NSLayoutConstraint.activate([
                label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
                label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16)
            ])
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 40
        case 1: return 100
        case 2: return 40
        case 3: return 40
        case 4: return 100
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = arrayPlayers[nextScreenPlayer]?.nombre // Aquí puedes agregar el nombre del jugador
        case 1:
            // Agregar imagen si es necesario
            cell.imageView?.image = UIImage(named: arrayPlayers[nextScreenPlayer]?.nombre ?? "")
            
        case 2:
            cell.textLabel?.text = arrayPlayers[nextScreenPlayer]?.numero
        case 3:
            cell.textLabel?.text = arrayPlayers[nextScreenPlayer]?.posicion
        case 4:
            cell.textLabel?.text = arrayPlayers[nextScreenPlayer]?.estadisticas
            cell.textLabel?.numberOfLines = 0
            default:
                break
            }
        return cell
    }
}
