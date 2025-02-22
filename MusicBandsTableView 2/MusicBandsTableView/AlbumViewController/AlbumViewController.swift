

import UIKit

class AlbumViewController: UIViewController {

    var selectedBand: Int!
    var dataSourceAlbum: UITableViewDiffableDataSource<Int, String>?
    
    let sectionTitles = ["Primer Álbum", "Segundo Álbum", "Tercer Álbum"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewAlbums.backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 229/255, alpha: 1.0)
        setDataSource()
        setSnapShot()
        tableViewAlbums.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var tableViewAlbums: UITableView!
    
    
    func setDataSource() {
        dataSourceAlbum = UITableViewDiffableDataSource(tableView: tableViewAlbums, cellProvider: { tableView, indexPath, myString in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            
            cell.textLabel?.text = myString
            cell.textLabel?.backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 229/255, alpha: 1.0)
            cell.imageView?.image = UIImage(named: albums[self.selectedBand].imageAlbum[indexPath.section])
            cell.detailTextLabel?.text = "\(albums[self.selectedBand].year[indexPath.section])"
            cell.backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 229/255, alpha: 1.0)
            cell.accessoryType = .disclosureIndicator
            
            return cell
        })
        
        
        
    }

    func setSnapShot(){
        var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
        snapshot.appendSections([0, 1, 2])
        
        let albumsNames = albums[selectedBand].nameAlbum

            for (index, name) in albumsNames.enumerated() {
                snapshot.appendItems([name], toSection: index)
            }

        dataSourceAlbum?.apply(snapshot)
    }
    
    
    

}


extension AlbumViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(bands[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedAlbum = albums[self.selectedBand].idAlbum[indexPath.section]
        let bandID = self.selectedBand
        
        //print("Album seleccionado: \(selectedAlbum), de la banda: \(String(describing: bandID))")
        
        let songViewController = storyboard?.instantiateViewController(withIdentifier: "SongViewController") as! SongViewController
        
        songViewController.selectedAlbum = selectedAlbum
        songViewController.bandID = bandID
        
        // Hacer push al siguiente ViewController
        navigationController?.pushViewController(songViewController, animated: true)
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.systemBlue
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = sectionTitles[section]
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        
        headerView.addSubview(label)
        
        // Configuración de restricciones para centrar la etiqueta
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
        
        return headerView
    }
}

