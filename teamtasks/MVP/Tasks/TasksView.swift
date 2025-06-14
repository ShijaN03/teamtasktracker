import UIKit

protocol TasksViewProtocol: AnyObject {
    
}

class TasksView: UIViewController, TasksViewProtocol {
    
    
    var presenter: TasksPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        setUpSubviews()
    }
    
    var tasks: [Task] = [
        Task(title: "1", description: "21313"),
        Task(title: "1", description: "21313"),
        Task(title: "1", description: "21313")
    ]
    
    private func setUpSubviews() {
        tableView()
    }
    
    private func tableView() {
        let tableView = UITableView()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        
    }
    
}
