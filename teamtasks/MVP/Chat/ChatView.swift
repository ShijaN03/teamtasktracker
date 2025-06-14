import UIKit

protocol ChatViewProtocol: AnyObject {
    
}

class ChatView: UIViewController, ChatViewProtocol {
    
    var presenter: ChatPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        
    }
}
