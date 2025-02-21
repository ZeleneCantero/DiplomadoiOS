//
//  ListMusic.swift
//  AppMusicProgramatico
//
//  Created by Diplomado on 23/10/24.
//

import UIKit

class ListMusicView: UIView {

    
    var nameArtist: String = ""
    var nameImage: String = ""
    var nameAlbum: String = ""
    var namePhotoMusic1: String = ""
    var nameButtonMusic1: String = ""
    var namePhotoMusic2: String = ""
    var nameButtonMusic2: String = ""
    var namePhotoMusic3: String = ""
    var nameButtonMusic3: String = ""
    
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setMainStack(arrayAlbum: (nameArtist, nameImage, nameAlbum, namePhotoMusic1, nameButtonMusic1, namePhotoMusic2, nameButtonMusic2, namePhotoMusic3, nameButtonMusic3))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var mainStack: UIStackView = {
       let stackView = UIStackView()
       stackView.translatesAutoresizingMaskIntoConstraints = false
       stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
       stackView.spacing = 10
         
       //stackView.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 250/255, alpha: 1)
        
       //stackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        stackView.layoutMargins = UIEdgeInsets(top: 30, left: 20, bottom: 200, right: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
       return stackView
   }()
    

    func setMainStack(arrayAlbum: (nameArtist: String, nameImage: String, nameAlbum: String, namePhotoMusic1: String, nameButtonMusic1: String, namePhotoMusic2: String, nameButtonMusic2: String, namePhotoMusic3: String, nameButtonMusic3: String)) {
        
        // Limpiar el stack antes de agregar nuevos elementos
        mainStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        addSubview(mainStack)

        let imageAndLabel1 = createStack(imageName: arrayAlbum.nameImage, text: arrayAlbum.nameAlbum, textAlbum: arrayAlbum.nameArtist)
        let song1 = createStackMusic(imageName: arrayAlbum.namePhotoMusic1, nameMusic: arrayAlbum.nameButtonMusic1, tag: 0)
        let song2 = createStackMusic(imageName: arrayAlbum.namePhotoMusic2, nameMusic: arrayAlbum.nameButtonMusic2, tag: 1)
        let song3 = createStackMusic(imageName: arrayAlbum.namePhotoMusic3, nameMusic: arrayAlbum.nameButtonMusic3, tag: 2)
        
        // Agregar los stacks al stack principal
        mainStack.addArrangedSubview(imageAndLabel1)
        mainStack.addArrangedSubview(song1)
        mainStack.addArrangedSubview(song2)
        mainStack.addArrangedSubview(song3)

        // Establecer restricciones del stack principal
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }


    
    private func createStack(imageName: String, text: String, textAlbum: String) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 5
        stack.heightAnchor.constraint(equalToConstant: 90).isActive = true
        //stack.backgroundColor = UIColor(red: 220/255, green: 200/255, blue: 255/255, alpha: 1)
        
        // Crear la imagen
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        //imageView.contentMode = .scaleAspectFit
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        imageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        
        // Crear el label
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.italicSystemFont(ofSize: 20)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        //label.widthAnchor.constraint(equalToConstant: 10).isActive = true
        label.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        // Crear el label
        let labelAlbum = UILabel()
        labelAlbum.setContentCompressionResistancePriority(.required, for: .vertical)
        labelAlbum.translatesAutoresizingMaskIntoConstraints = false
        labelAlbum.text = textAlbum
        labelAlbum.textAlignment = .center
        labelAlbum.font = UIFont.boldSystemFont(ofSize: 15)
        label.heightAnchor.constraint(equalToConstant: 15).isActive = true

        
        // Añadir la imagen y el label al stack horizontal
        stack.addArrangedSubview(labelAlbum)
        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(label)
        
        return stack
    }
    
    private func createStackMusic(imageName: String, nameMusic: String, tag: Int) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 1
        stack.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        // Crear la imagen
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = false
        imageView.widthAnchor.constraint(equalToConstant: 100 ).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        //Crear button que es el nombre de la cancion
        let buttonAlbum = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.cornerStyle = .large
        configuration.background.backgroundColor = UIColor(red: 1.0, green: 182/255, blue: 193/255, alpha: 1.0)
        configuration.baseForegroundColor = .black
        configuration.title = nameMusic
//        buttonAlbum.widthAnchor.constraint(equalToConstant: 20).isActive = true
//        buttonAlbum.heightAnchor.constraint(equalToConstant: 10).isActive = true
        buttonAlbum.configuration = configuration

        
        // Añadir la imagen y el label al stack horizontal
        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(buttonAlbum)
 
        return stack
    }
    
}


