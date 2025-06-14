protocol TabBarControllerPresenterProtocol: AnyObject {
    init(view: TabBarControllerViewProtocol?)
}

class TabBarControllerPresenter: TabBarControllerPresenterProtocol {
    required init(view: (any TabBarControllerViewProtocol)?) {
        self.view = view
    }
    
    weak var view: TabBarControllerViewProtocol?
}
