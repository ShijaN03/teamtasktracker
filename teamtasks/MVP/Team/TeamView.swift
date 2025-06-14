import UIKit

protocol TeamViewProtocol: AnyObject {
    
}

class TeamView: UIViewController, TeamViewProtocol {
    
    var presenter: TeamPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
    }
}
