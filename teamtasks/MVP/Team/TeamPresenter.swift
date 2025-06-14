protocol TeamPresenterProtocol: AnyObject {
    init(view: TeamView)
}

class TeamPresenter: TeamPresenterProtocol {
    
    required init(view: TeamView) {
        self.view = view
    }
    
    weak var view: TeamViewProtocol?
}
