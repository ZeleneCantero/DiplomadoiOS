
import UIKit

class SongViewController: UIViewController {

        
    var selectedAlbum: Int!
    var bandID: Int!
    
    var dataSourceSong: UITableViewDiffableDataSource<Int, String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSongs.backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 229/255, alpha: 1.0)
        setDataSource()
        setSnapShot()
        tableViewSongs.delegate = self

    }
    

    @IBOutlet weak var tableViewSongs: UITableView!
    
    
    func setDataSource() {
        dataSourceSong = UITableViewDiffableDataSource(tableView: tableViewSongs, cellProvider: { tableView, indexPath, myString in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .value1, reuseIdentifier: "cell")
            
            cell.textLabel?.text = myString
            cell.textLabel?.backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 229/255, alpha: 1.0)
            cell.imageView?.image = UIImage(named: songs[self.bandID].imageSong[self.selectedAlbum])
            cell.detailTextLabel?.text = songs[self.bandID].time[self.selectedAlbum][indexPath.row]
            cell.backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 229/255, alpha: 1.0)

            
            return cell
        })
        
        
        
    }

    func setSnapShot(){
        var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
        snapshot.appendSections([0])
        let songsNames = songs[bandID].nameSong[selectedAlbum]
        snapshot.appendItems(songsNames)
        dataSourceSong?.apply(snapshot)
    }
    
    
    

}


extension SongViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}

