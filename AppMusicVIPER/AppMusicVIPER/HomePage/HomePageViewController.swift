import UIKit

protocol HomePageViewProtocol: AnyObject {
    func showArtists(_ artists: [HomePageEntity])
}

class HomePageViewController: UIViewController, HomePageViewProtocol {
    
    var presenter: HomePagePresenterProtocol!
    
    lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.text = "Artists"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var mainStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 20
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        mainStack.addArrangedSubview(artistLabel)
    }
    
    func showArtists(_ artists: [HomePageEntity]) {
        for (index, artist) in artists.enumerated() {
            mainStack.addArrangedSubview(createStackWithImageAndButton(nameImage: artist.imageNameArtist, nameButton: artist.buttonNameArtist, tag: index))
        }
    }
    
    func createStackWithImageAndButton(nameImage: String, nameButton: String, tag: Int) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 20
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: nameImage)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonArtist = UIButton()
        buttonArtist.setTitle(nameButton, for: .normal)
        buttonArtist.setTitleColor(.black, for: .normal)
        buttonArtist.backgroundColor = .blue
        buttonArtist.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        buttonArtist.tag = tag
        buttonArtist.translatesAutoresizingMaskIntoConstraints = false
        buttonArtist.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(buttonArtist)
        
        return stack
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        presenter.artistSelected(at: sender.tag)
    }
}

