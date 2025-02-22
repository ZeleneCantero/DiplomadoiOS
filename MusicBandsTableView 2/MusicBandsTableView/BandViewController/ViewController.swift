


import UIKit

class ViewController: UIViewController {

    
    
    //<secciones,tipo de dato>
    
    @IBOutlet weak var tableView: UITableView!
    
    //no puede haber elementos repetidos
    var dataSource: UITableViewDiffableDataSource<Int, String>?

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .black
        tableView.backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 229/255, alpha: 1.0)
        setDataSource()
        setSnapShot()
        tableView.delegate = self
        
    }
    
    
    func setDataSource() {
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, myString in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
            let info = bands[indexPath.row]
            cell.textLabel?.text = myString
            cell.textLabel?.backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 229/255, alpha: 1.0)
            cell.imageView?.image = UIImage(named: info.imageBand)
            cell.backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 229/255, alpha: 1.0)
            cell.accessoryType = .disclosureIndicator
            return cell
        })
    }

    func setSnapShot(){
        var snapshop = NSDiffableDataSourceSnapshot<Int, String>()
        snapshop.appendSections([0])
        
        var bandNames = [String]()
        for band in bands{
            bandNames.append(band.nameBand)
        }
        
        snapshop.appendItems(bandNames)
        dataSource?.apply(snapshop)
    }

}


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(bands[indexPath.row])
        // Desmarcar la celda seleccionada
        tableView.deselectRow(at: indexPath, animated: true)
                
        // Obtener la banda seleccionada
        let selectedBand = bands[indexPath.row].idBand
                
        // Crear el siguiente ViewController (AlbumViewController)
        let albumViewController = storyboard?.instantiateViewController(withIdentifier: "AlbumViewController") as! AlbumViewController
                
        // Pasar la información de la banda seleccionada al siguiente ViewController
        albumViewController.selectedBand = selectedBand
                
        // Hacer push al siguiente ViewController
        navigationController?.pushViewController(albumViewController, animated: true)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}

