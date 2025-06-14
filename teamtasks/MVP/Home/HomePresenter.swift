protocol HomePresenterProtocol: AnyObject {
    init(view: HomeViewProtocol?)
    
}

class HomePresenter: HomePresenterProtocol {
    
    required init(view: (any HomeViewProtocol)?) {
        self.view = view
    }
    
    weak var view: HomeViewProtocol?
    
}
