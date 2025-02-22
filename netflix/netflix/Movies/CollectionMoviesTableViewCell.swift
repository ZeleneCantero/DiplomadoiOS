import UIKit

class CollectionMoviesTableViewCell: UITableViewCell {
    static let identifier = "CollectionMoviesTableViewCell"

    //Array peliculas de cada categoria
    let imagesAmor =  ["3msc", "2m", "atravesDeMiVentana", "diarioDeUnaPasion", "tengoGanasDeTi"]
    let imagesTerror = ["conjuro","niño", "siniestro", "laProfecia", "libroDePiedra"]
    let imagesPsicologicas =  ["cisneNegro", "memento", "origen", "silencio", "sextoSentido"]
    let imagesSuspenso = ["contratiempo", "run", "seven", "prisioneros", "origen"]
    
    var sectionCategory: Int = 0
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = UIColor(red: 1.0, green: 0.85, blue: 0.85, alpha: 1.0)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(red: 0.678, green: 0.847, blue: 0.902, alpha: 1.0)
        contentView.addSubview(collectionView)
        
            collectionView.delegate = self
            collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    func configure(with category: Int) {
        sectionCategory = category
        collectionView.reloadData()
    }
}

extension CollectionMoviesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor(red: 1.0, green: 0.85, blue: 0.85, alpha: 1.0)
        
        let imageView = UIImageView(frame: cell.contentView.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        // Limpiar subvistas previas
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        
        // Seleccionar el array de imágenes correcto según la categoría
        switch sectionCategory {
        case 0:
            imageView.image = UIImage(named: imagesAmor[indexPath.item])
        case 1:
            imageView.image = UIImage(named: imagesTerror[indexPath.item])
        case 2:
            imageView.image = UIImage(named: imagesPsicologicas[indexPath.item])
        case 3:
            imageView.image = UIImage(named: imagesSuspenso[indexPath.item])
        default:
            break
        }
        
        cell.contentView.addSubview(imageView)
        return cell
    }
}
