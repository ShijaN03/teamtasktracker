protocol TasksPresenterProtocol: AnyObject {
    init(view: TasksView)
}

class TasksPresenter: TasksPresenterProtocol {
    
    required init(view: TasksView) {
        self.view = view
    }
    
    weak var view: TasksViewProtocol?
    
    
}
