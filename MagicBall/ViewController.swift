

import UIKit

class ViewController: UIViewController {
    
    let ballArray = [#imageLiteral(resourceName: "ball1.png"),#imageLiteral(resourceName: "ball2.png"),#imageLiteral(resourceName: "ball3.png"),#imageLiteral(resourceName: "ball4.png"),#imageLiteral(resourceName: "ball5.png")]
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 25
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var askLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Ask Me Anything..."
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 45, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var ballImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var askButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Ask", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.titleLabel?.numberOfLines = 0
        button.tintColor = UIColor(red: 13/255, green: 145/255, blue: 215/255, alpha: 1)
        button.layer.cornerRadius = 15
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(askButtonPressed), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    func setupViews() {
        view.backgroundColor = UIColor(red: 16/255, green: 12/255, blue: 44/255, alpha: 1)
        view.addSubview(stackView)
        stackView.addArrangedSubview(askLabel)
        stackView.addArrangedSubview(ballImageView)
        stackView.addArrangedSubview(askButton)
    }

    @objc func askButtonPressed() {
        ballImageView.image = ballArray.randomElement()
    }
}

extension ViewController {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -45),
            
            askButton.heightAnchor.constraint(equalToConstant: 45),
            askButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
