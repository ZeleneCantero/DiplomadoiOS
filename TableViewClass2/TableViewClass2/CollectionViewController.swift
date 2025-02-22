//
//  CollectionViewController.swift
//  TableViewClass2
//
//  Created by Diplomado on 29/11/24.
//

import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet weak var colectionView: UICollectionView!
    
    let array = ["Buscando a nemo","Annabelle","Barbie","El rey leon", "El padrino", "Star Wars", "Spiderman","Harry Potter", "Eso" , "Yo antes de ti"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colectionView.dataSource = self
        colectionView.delegate = self
        colectionView.collectionViewLayout = UICollectionViewFlowLayout()
        // Do any additional setup after loading the view.
    }
    
    
}


extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCollectionViewCell
        cell.movieTitle.text = array[indexPath.row]
        cell.movieImage.image = UIImage(named: array[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 200, height: 300)
    }
}
