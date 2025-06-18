import UIKit

protocol TaskInfoPresenterProtocol: AnyObject {
    init(view: TaskInfoView, task: Task)
    func viewDidLoad()
    func takeButtonTapped()
}

class TaskInfoPresenter: TaskInfoPresenterProtocol {
    
    weak var view: TaskInfoViewProtocol?
    private var task: Task
    
    required init(view: TaskInfoView, task: Task) {
        self.view = view
        self.task = task
    }
    
    func viewDidLoad() {
        view?.displayTask(title: task.title, description: task.description, isStarted: task.isStarted)
    }
    
    func takeButtonTapped() {
        task.isStarted = true
        view?.displayTask(title: task.title, description: task.description, isStarted: task.isStarted)
    }
    
}
