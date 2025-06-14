protocol ChatPresenterProtocol: AnyObject {
    init(view: ChatViewProtocol)
}

class ChatPresenter: ChatPresenterProtocol {
    
    required init(view: any ChatViewProtocol) {
        self.view = view
    }
    
    
    weak var view: ChatViewProtocol?
    
    
}
