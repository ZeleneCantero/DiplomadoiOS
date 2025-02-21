//
//  Album.swift
//  AppMusicProgramatico
//
//  Created by Diplomado on 23/10/24.
//

import UIKit

class AlbumView: UIView {

    //Variable de tipo del prtocolo para saber el tag
    weak var tagDelegate: TagButtonView?
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setMainStack()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var mainStack: UIStackView = {
       let stackView = UIStackView()
       stackView.translatesAutoresizingMaskIntoConstraints = false
       stackView.axis = .vertical
       stackView.distribution = .fillEqually
       stackView.alignment = .center
       stackView.spacing = 10
        
       stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 30, right: 10)
       stackView.isLayoutMarginsRelativeArrangement = true
       return stackView
   }()
    
    private func setMainStack() {
        addSubview(mainStack)
       
        NSLayoutConstraint.activate([
            mainStack.heightAnchor.constraint(equalToConstant: 290),
            mainStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
        
        
        mainStack.addArrangedSubview(createIamgeWithButton(nameImage: "albumHumbe", nameButton: "Humbe: Album Escencia", tag: 0))
        mainStack.addArrangedSubview(createIamgeWithButton(nameImage: "albumLatinMafia", nameButton: "Latin Mafia: Album No digas nada", tag: 1))
        mainStack.addArrangedSubview(createIamgeWithButton(nameImage: "albumLanaDelRey", nameButton: "Lana Del Rey: Album Paradise", tag: 2))
    }
    
    
    func createIamgeWithButton(nameImage: String, nameButton: String, tag: Int) -> UIStackView {
        //Stack
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 1
        //stack.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        // Crear la imagen
        let imageView = UIImageView()
        imageView.image = UIImage(named: nameImage)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = false
//        imageView.widthAnchor.constraint(equalToConstant: 100 ).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        //Crear el boton
        let buttonAlbum = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.cornerStyle = .large
        configuration.background.backgroundColor = UIColor(red: 1.0, green: 182/255, blue: 193/255, alpha: 1.0)
        configuration.baseForegroundColor = .black
        configuration.title = nameButton
        buttonAlbum.configuration = configuration
//        buttonAlbum.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        buttonAlbum.widthAnchor.constraint(equalToConstant: 290).isActive = true
        buttonAlbum.setContentHuggingPriority(.required, for: .vertical)
        buttonAlbum.tag = tag
        buttonAlbum.addTarget(self, action: #selector(pressBTT(_:)), for: .touchUpInside)
        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(buttonAlbum)
        
        return stack
    }
    
    //Funcion para boton del tag
    @objc private func pressBTT(_ sender: UIButton){
        tagDelegate?.pressButton(tag: sender.tag)
        //print("Sender Tag: Album View \(sender.tag)")
        
    }
    
}

    //Protocolo para saber el tag
    protocol  TagButtonView: AnyObject{
        func pressButton(tag: Int)
    }
