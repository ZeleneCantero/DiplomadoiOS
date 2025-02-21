import UIKit

class ListMusicController: UIViewController {
    
    var tag: Int?

    private var customView: ListMusicView{
        return view as! ListMusicView
    }
    

    var arrayHumbe = (nameArtist: "HUMBE",
                      nameImage: "albumHumbe",
                      nameAlbum: "Album: Escencia",
                      namePhotoMusic1: "ultimamente",
                      nameButtonMusic1: "Ultimamente",
                      namePhotoMusic2: "patadasDeAhogado",
                      nameButtonMusic2: "Patadas de ahogado",
                      namePhotoMusic3: "teLoPrometo",
                      nameButtonMusic3: "Te lo prometo"
    )

    var arrayLatin = (nameArtist: "LATIN MAFIA",
                      nameImage: "albumLatinMafia",
                      nameAlbum: "No Digas nada",
                      namePhotoMusic1: "ciudadDeLasLuces",
                      nameButtonMusic1: "Ciudad de las luces",
                      namePhotoMusic2: "fantasmas",
                      nameButtonMusic2: "Fantasmas",
                      namePhotoMusic3: "flores",
                      nameButtonMusic3: "Flores"
    )
    

    var arrayLana = (nameArtist: "LANA DEL REY",
                      nameImage: "albumLanaDelRey",
                      nameAlbum: "Paradise",
                      namePhotoMusic1: "blueJeans",
                      nameButtonMusic1: "Blue Jeans",
                      namePhotoMusic2: "bornToDie",
                      nameButtonMusic2: "Born to die",
                      namePhotoMusic3: "youngAndBeautiful",
                      nameButtonMusic3: "Young and beautiful"
    )




    override func loadView() {
        view = ListMusicView() // Asignar la vista principal
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ListMusicController: \(tag ?? 3)")
        view.backgroundColor = UIColor(red: 1.0, green: 1, blue: 193/255, alpha: 1.0)

        // Usar customView para establecer los datos
        switch tag {
        case 0:
            //Aqui se se esta pasando por completo la tupla, ya que en el setMainStack es lo que recibe
            customView.setMainStack(arrayAlbum: arrayHumbe)
            
        case 1:
            customView.setMainStack(arrayAlbum: arrayLatin)
        case 2:
            customView.setMainStack(arrayAlbum: arrayLana)
        default:
            print("Error pantalla")
        }
    }

    
//    private func accessGrantedSegueXIB(tag: Int) {
//        let listItem = MusicViewController(nibName: nil, bundle: nil)
//        navigationController?.modalPresentationStyle = .none
//        navigationController?.navigationBar.prefersLargeTitles = true
//        //navigationController?.navigationBar.isTranslucent = false
//        navigationController?.pushViewController(listItem, animated: true)
//
//        }
}
