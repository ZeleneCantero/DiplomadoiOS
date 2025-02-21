import UIKit

class AlbumViewController: UIViewController , TagButtonView {

    var tagG = ListMusicController()
    var sendTagController:Int = 3
    
    private var customView: AlbumView{
        return view as! AlbumView
    }
    
    override func loadView() {
        view = AlbumView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 1.0, green: 182/255, blue: 193/255, alpha: 1.0)
        navigationItem.largeTitleDisplayMode = .never
        
        //Tag
        customView.tagDelegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        //navigationController?.isNavigationBarHidden = true
    }
    
    
    func pressButton(tag: Int) {
        print("Entre")
        //print("Boton apretado: \(tagG.tag ?? 9)")
       
        
        switch tag {
        case 0:
            print("Botón 1 presionado: Humbe: Album Escencia")
            print("Pantalla 1")
            sendTagController = 0
            print("Tag asignado \(sendTagController)")
            //view = ListMusicView()
            accessGrantedSegueXIB(tag: sendTagController)
            
        case 1:
            print("Botón 2 presionado: Latin Mafia: Album No digas nada")
            print("Pantalla 2")
            sendTagController = 1
            print("Tag asignado \(sendTagController)")
            //view = ListMusicView()
            accessGrantedSegueXIB(tag: sendTagController)
        case 2:
            print("Botón 3 presionado: Lana Del Rey: Album Paradise")
            print("Pantalla 3")
            sendTagController = 2
            print("Tag asignado \(sendTagController)")
            //view = ListMusicView()
            accessGrantedSegueXIB(tag: sendTagController)
        default:
            print("Error")
        }
    }
    
    private func accessGrantedSegueXIB(tag: Int) {
        let listItem = ListMusicController(nibName: nil, bundle: nil) //Esto es para poderme pasar a la vista que tiene la informacion de lo que se compro
        //sendTagController = tagG.tag!
        listItem.tag = tag
        //tagG.tag! = sendTagController
        print("Tag \(tag)")
        navigationController?.modalPresentationStyle = .none
        navigationController?.navigationBar.prefersLargeTitles = true
        //navigationController?.navigationBar.isTranslucent = false
        navigationController?.pushViewController(listItem, animated: true)

        }
}
