//
//  Music.swift
//  AppMusicProgramatico
//
//  Created by Diplomado on 23/10/24.
//

import UIKit

class MusicView: UIView {
    
    //Imagen de la cancion
    // Crear la imagen
    lazy var imageMusic: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = false
        //        imageView.widthAnchor.constraint(equalToConstant: 100 ).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return imageView
    }()
    
    lazy var labelNameSong: UILabel = {
        let labelNSong = UILabel()
        return labelNSong
    }()
    
    lazy var labelNameArtist: UILabel = {
        let labelNArtist = UILabel()
        return labelNArtist
    }()
    
    lazy var labeltimeMusic: UILabel = {
        let labelTMusic = UILabel()
        return labelTMusic
    }()
    
    lazy var labeltimeMusicFinal: UILabel = {
        let labelTMFinal = UILabel()
        return labelTMFinal
    }()
    
    lazy var buttonBefore: UIButton = {
        //Crear button que es el nombre de la cancion
        let buttonBefore = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.cornerStyle = .large
        configuration.background.backgroundColor = UIColor(red: 1.0, green: 182/255, blue: 193/255, alpha: 1.0)
        configuration.baseForegroundColor = .black
//        buttonAlbum.widthAnchor.constraint(equalToConstant: 20).isActive = true
//        buttonAlbum.heightAnchor.constraint(equalToConstant: 10).isActive = true
        buttonBefore.configuration = configuration
        return buttonBefore
    }()
    
    lazy var buttonPausePlay: UIButton = {
        //Crear button que es el nombre de la cancion
        let buttonPP = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.cornerStyle = .large
        configuration.background.backgroundColor = UIColor(red: 1.0, green: 182/255, blue: 193/255, alpha: 1.0)
        configuration.baseForegroundColor = .black
//        buttonAlbum.widthAnchor.constraint(equalToConstant: 20).isActive = true
//        buttonAlbum.heightAnchor.constraint(equalToConstant: 10).isActive = true
        buttonPP.configuration = configuration
        return buttonPP
    }()
    
    lazy var buttonNext: UIButton = {
        //Crear button que es el nombre de la cancion
        let buttonN = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.cornerStyle = .large
        configuration.background.backgroundColor = UIColor(red: 1.0, green: 182/255, blue: 193/255, alpha: 1.0)
        configuration.baseForegroundColor = .black
//        buttonAlbum.widthAnchor.constraint(equalToConstant: 20).isActive = true
//        buttonAlbum.heightAnchor.constraint(equalToConstant: 10).isActive = true
        buttonN.configuration = configuration
        return buttonN
    }()
    
    lazy var sliderTime: UISlider = {
        let sliderT = UISlider()
        return sliderT
    }()
    

    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setMainStack()
//        setMainStack(arrayAlbum: (nameArtist, nameImage, nameAlbum, namePhotoMusic1, nameButtonMusic1, namePhotoMusic2, nameButtonMusic2, namePhotoMusic3, nameButtonMusic3))
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
    

    func setMainStack() {
        
        // Limpiar el stack antes de agregar nuevos elementos
        mainStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        addSubview(mainStack)

        let imageAndLabel1 = createStack(imageName: "albumHumbe", labelNameArtist: "HUMBE", labelNameSong: "Ultimamente")

        
        // Agregar los stacks al stack principal
        mainStack.addArrangedSubview(imageAndLabel1)

        // Establecer restricciones del stack principal
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    
    
    private func createStack(imageName: String, labelNameArtist: String, labelNameSong: String) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 5
        stack.heightAnchor.constraint(equalToConstant: 90).isActive = true
        //stack.backgroundColor = UIColor(red: 220/255, green: 200/255, blue: 255/255, alpha: 1)
        
        // Crear la imagen de la cancion
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        //imageView.contentMode = .scaleAspectFit
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        imageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        
        // Crear el label cancion
        let labelSong = UILabel()
        labelSong.text = labelNameSong
        labelSong.textAlignment = .center
        labelSong.font = UIFont.italicSystemFont(ofSize: 20)
        labelSong.setContentCompressionResistancePriority(.required, for: .vertical)
        //label.widthAnchor.constraint(equalToConstant: 10).isActive = true
        labelSong.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        // Crear el label del artista
        let labelArtist = UILabel()
        labelArtist.setContentCompressionResistancePriority(.required, for: .vertical)
        labelArtist.translatesAutoresizingMaskIntoConstraints = false
        labelArtist.text = labelNameArtist
        labelArtist.textAlignment = .center
        labelArtist.font = UIFont.boldSystemFont(ofSize: 15)
        labelArtist.heightAnchor.constraint(equalToConstant: 15).isActive = true

        
        // Añadir la imagen y el label al stack horizontal
        stack.addArrangedSubview(labelSong)
        stack.addArrangedSubview(labelArtist)
        stack.addArrangedSubview(imageView)
        
        return stack
    }

}
