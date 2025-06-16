import UIKit

protocol TaskInfoPresenterProtocol: AnyObject {
    init(view: TaskInfoView, task: Task)
    func viewDidLoad()
}

class TaskInfoPresenter: TaskInfoPresenterProtocol {
    
    weak var view: TaskInfoViewProtocol?
    private let task: Task
    
    required init(view: TaskInfoView, task: Task) {
        self.view = view
        self.task = task
    }
    
    func viewDidLoad() {
        view?.displayTask(title: task.title, description: task.description)
    }
    
}
