import UIKit

protocol TaskInfoViewProtocol: AnyObject {
    func displayTask(title: String, description: String, isStarted: Bool)
}

class TaskInfoView: UIViewController, TaskInfoViewProtocol {
    
    var presenter: TaskInfoPresenterProtocol!
    
    private var isStarted: Bool = false
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let headView = UIView()
    private let takeButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        view.backgroundColor = .white
        setUpSubviews()
        
    }
    
    func displayTask(title: String, description: String, isStarted: Bool) {
        titleLabel.text = title
        descriptionLabel.text = description
        self.isStarted = isStarted
        updateTakeButton()
    }
    
    private func setUpSubviews() {
        navigationItem.hidesBackButton = true
        buildHeadView()
        setUpBackButton()
        setUpTitleLabel()
        setUpDescriptionLabel()
        setUpTakeButton()
        
    }
    
    private func buildHeadView() {
        
        let titleLabel = UILabel()
        
        view.addSubview(headView)
        
        headView.backgroundColor = .black
        
        headView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headView.topAnchor.constraint(equalTo: view.topAnchor),
            headView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        headView.addSubview(titleLabel)
        
        titleLabel.text = "Tasks"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: headView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: headView.topAnchor, constant: 60)
        ])
        
    }
    
    private func setUpBackButton() {
        let button = UIButton(type: .system)
        
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        
        let barButtonItem = UIBarButtonItem(customView: button)
        navigationItem.leftBarButtonItem = barButtonItem
    }
    
    
    @objc private func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setUpTitleLabel() {
        
        view.addSubview(titleLabel)
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
        ])
    }
    
    private func setUpDescriptionLabel() {
        
        view.addSubview(descriptionLabel)
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.font = UIFont.systemFont(ofSize: 20)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            descriptionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300)
        ])
    }
    
    private func setUpTakeButton() {
        
        takeButton.addTarget(self, action: #selector(takeButtonTapped), for: .touchUpInside)
        
        if isStarted {
            takeButton.setTitle("Начато", for: .normal)
            takeButton.backgroundColor = .green
            takeButton.tintColor = .white
        } else {
            takeButton.setTitle("Взять", for: .normal)
            takeButton.backgroundColor = .gray
            takeButton.tintColor = .white
        }
        takeButton.layer.cornerRadius = 12
        
        view.addSubview(takeButton)
        
        takeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            takeButton.widthAnchor.constraint(equalToConstant: 100),
            takeButton.heightAnchor.constraint(equalToConstant: 40),
            takeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            takeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200)
        ])
    }
    
    private func updateTakeButton() {
        if isStarted {
            takeButton.setTitle("Начато", for: .normal)
            takeButton.backgroundColor = .green
            takeButton.tintColor = .white
        } else {
            takeButton.setTitle("Взять", for: .normal)
            takeButton.backgroundColor = .gray
            takeButton.tintColor = .white
        }
    }
    
    @objc private func takeButtonTapped() {
        presenter.takeButtonTapped()
    }
}
