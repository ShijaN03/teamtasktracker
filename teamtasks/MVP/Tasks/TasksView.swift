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
    
    let tableView = UITableView()
    
    var tasks: [Task] = [
        Task(title: "Разработка интерфейса", description: "Создать макет экрана задач и реализовать UI в соответствии с дизайном."),
            Task(title: "Интеграция API", description: "Подключить сервер и отобразить реальные данные в приложении."),
            Task(title: "Написание тестов", description: "Добавить unit-тесты для бизнес-логики presenter."),
            Task(title: "Обработка ошибок", description: "Реализовать отображение ошибок при проблемах с сетью."),
            Task(title: "Добавление анимаций", description: "Улучшить пользовательский опыт с помощью плавных переходов."),
            Task(title: "Рефакторинг кода", description: "Разделить модули по архитектуре и улучшить читаемость."),
            Task(title: "Добавление новых экранов", description: "Реализовать экран профиля пользователя."),
            Task(title: "Локализация", description: "Добавить поддержку русского и английского языков."),
            Task(title: "Сохранение состояния", description: "Обеспечить сохранение данных между сессиями."),
            Task(title: "Настройка CI/CD", description: "Автоматизировать сборку и проверку проекта.")
    ]
    
    private func setUpSubviews() {
        buildTableView()
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
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        
    }
    
}
