import UIKit

protocol HomePageRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    func navigateToArtistDetail(with artist: HomePageEntity)
}

class HomePageRouter: HomePageRouterProtocol {
    
    weak var viewController: UIViewController?
    
    func navigateToArtistDetail(with artist: HomePageEntity) {
        // Implementa la navegación a la pantalla de detalle del artista aquí
        let artistDetailViewController = ArtistDetailViewController(artist: artist)
        viewController?.navigationController?.pushViewController(artistDetailViewController, animated: true)
    }
}
