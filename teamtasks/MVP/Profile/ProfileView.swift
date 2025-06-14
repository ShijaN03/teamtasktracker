import UIKit

protocol ProfileViewProtocol: AnyObject {
    
}

class ProfileView: UIViewController, ProfileViewProtocol {
    
    var presenter: ProfilePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
    
}
