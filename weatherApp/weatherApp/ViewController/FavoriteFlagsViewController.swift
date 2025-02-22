//
//  FavoriteFlagsCollectionViewController.swift
//  pokedex-clase
//
//  Created by Diplomado on 07/02/25.
//
import UIKit

class FavoriteFlagsCollectionViewController: UICollectionViewController {
    
    private let viewModel = FavoriteFlagsViewModel()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white

        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: viewModel.cellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.updateView()
        collectionView.reloadData()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        print("Tocando \(viewModel.flag(at: indexPath).name)")
        let flagsDetailViewController = UbicationFlagsViewController(flags: viewModel.flag(at: indexPath))
        navigationController?.pushViewController(flagsDetailViewController, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.cellIdentifier, for: indexPath)
        
        // Limpiar las subvistas existentes para evitar superposición
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
//        
        let flag = viewModel.flag(at: indexPath)

        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if flag.name == "Canada"{
            imageView.image = UIImage(named: "CanadáCA")
        }else{
            imageView.image = UIImage(named: flag.name)
        }
                
        cell.contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16),
            imageView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -16)
        ])
        
        return cell
    }
}

extension FavoriteFlagsCollectionViewController: UICollectionViewDelegateFlowLayout {
    // Tamaño dinámico de las celdas para que quepan dos imágenes por fila
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = (collectionViewLayout as! UICollectionViewFlowLayout).minimumInteritemSpacing * 2
        let availableWidth = collectionView.bounds.width - paddingSpace
        let widthPerItem = availableWidth / 2
        
        return CGSize(width: widthPerItem, height: widthPerItem * 0.9)
    }
}
