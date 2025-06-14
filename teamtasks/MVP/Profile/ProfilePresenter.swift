protocol ProfilePresenterProtocol: AnyObject {
    init(view: ProfileViewProtocol?)
}

class ProfilePresenter: ProfilePresenterProtocol {
    
    required init(view: (any ProfileViewProtocol)?) {
        self.view = view
    }
    
    weak var view: ProfileViewProtocol?
    
}
