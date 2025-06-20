import UIKit

protocol TasksViewProtocol: AnyObject {
    
}

class TasksView: UIViewController, TasksViewProtocol {
    
    var presenter: TasksPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpSubviews()
    }
    
    private let headView = UIView()
    let tableView = UITableView()
    
    var tasks: [Task] = [
        Task(title: "Разработка интерфейса", description: "Создать макет экрана задач и реализовать UI в соответствии с дизайном.", isStarted: false),
            Task(title: "Интеграция API", description: "Подключить сервер и отобразить реальные данные в приложении.", isStarted: false),
            Task(title: "Написание тестов", description: "Добавить unit-тесты для бизнес-логики presenter.", isStarted: false),
            Task(title: "Обработка ошибок", description: "Реализовать отображение ошибок при проблемах с сетью.", isStarted: false),
            Task(title: "Добавление анимаций", description: "Улучшить пользовательский опыт с помощью плавных переходов.", isStarted: false),
            Task(title: "Рефакторинг кода", description: "Разделить модули по архитектуре и улучшить читаемость.", isStarted: false),
            Task(title: "Добавление новых экранов", description: "Реализовать экран профиля пользователя.", isStarted: false),
            Task(title: "Локализация", description: "Добавить поддержку русского и английского языков.", isStarted: false),
            Task(title: "Сохранение состояния", description: "Обеспечить сохранение данных между сессиями.", isStarted: false),
            Task(title: "Настройка CI/CD", description: "Автоматизировать сборку и проверку проекта.", isStarted: false)
    ]
    
    private func setUpSubviews() {
        buildHeadView()
        buildTableView()
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
    
    private func buildTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.isUserInteractionEnabled = true
        
        tableView.register(TaskCell.self, forCellReuseIdentifier: TaskCell.identifier)
        
        tableView.separatorStyle = .none
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: headView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        
    }
    
    
}
