import UIKit

protocol TaskInfoViewProtocol: AnyObject {
    func displayTask(title: String, description: String)
}

class TaskInfoView: UIViewController, TaskInfoViewProtocol {
    
    var presenter: TaskInfoPresenterProtocol!
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        view.backgroundColor = .white
        setUpTitleLabel()
        setUpDescriptionLabel()
        
    }
    
    func displayTask(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
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
}
