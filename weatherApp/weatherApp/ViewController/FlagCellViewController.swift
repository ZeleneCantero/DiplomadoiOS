import UIKit

class FlagCellViewController: UITableViewCell {
    private let containerStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .left
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal) // Evita que se colapse
        return label
    }()
    
    private let flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        containerStack.addArrangedSubview(nameLabel)
        containerStack.addArrangedSubview(flagImageView)
        
        contentView.addSubview(containerStack)
        
        NSLayoutConstraint.activate([
            containerStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            containerStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            containerStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // Restricciones para flagImageView pero con prioridad baja
            flagImageView.widthAnchor.constraint(equalToConstant: 130),
            flagImageView.heightAnchor.constraint(equalToConstant: 110)
        ])
    }
    
    func configure(with name: String, image: UIImage?) {
        nameLabel.text = name
        flagImageView.image = name == "Canada ♥️" || name == "Canada" ? UIImage(named: "CanadáCA") : image
    }
}
