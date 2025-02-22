////
////  DetailTeamsCollectionViewCell.swift
////  enciclopediaDeEquiposDeportivosEZ
////
////  Created by Zelene Yosseline Isayana Montes Cantero on 15/12/24.
////
//import UIKit
//
//class DetailTeamsCollectionViewCell: UICollectionViewCell {
//    
//    // Agregar el UILabel
//    let label: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.textColor = .black
//        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        // Configurar la vista de contenido
//        contentView.addSubview(label)
//        contentView.backgroundColor = UIColor(red: 1.0, green: 0.85, blue: 0.85, alpha: 1.0)
//        
//        // Configurar restricciones para el UILabel
//        NSLayoutConstraint.activate([
//            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            label.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
//            label.heightAnchor.constraint(equalToConstant: 20)
//        ])
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
