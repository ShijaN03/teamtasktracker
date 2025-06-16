import UIKit

protocol TabBarControllerViewProtocol: AnyObject {
    
}

class TabBarControllerView: UITabBarController, TabBarControllerViewProtocol {
    
    weak var presenter: TabBarControllerPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpTabBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUpTabBarShape()
        
    }
    
    
    private func setUpTabBar() {
        
        viewControllers = [
            generateVC(viewController: Builder.buildTasksView(), title: "Tasks", image: UIImage(systemName: "list.bullet") ?? UIImage()),
            generateVC(viewController: Builder.buildChatView(), title: "Chat", image: UIImage(systemName: "message") ?? UIImage()),
            generateVC(viewController: Builder.buildTeamView(), title: "Team", image: UIImage(systemName: "person.3") ?? UIImage()),
            generateVC(viewController: Builder.buildProfileView(), title: "Profile", image: UIImage(systemName: "person.circle") ?? UIImage())
        ]
        
    }
    
    private func setUpTabBarShape() {
        let layer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
            center: CGPoint(
                x: tabBar.bounds.width/2,
                y: tabBar.bounds.height/2 - 15),
            size: CGSize(
                width: 360,
                height: 70)),
            cornerRadius: 40)
        
        layer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(layer, at: 0)
        tabBar.itemPositioning = .centered
        tabBar.itemWidth = tabBar.bounds.width / 7
        
        layer.fillColor = UIColor.tabBarBackgroundColor.cgColor
        tabBar.tintColor = .tabBarSelectedItemColor
        tabBar.unselectedItemTintColor = .tabBarItemColor
        
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.isTranslucent = true
        tabBar.backgroundColor = .clear
        
        
    }
    
    private func generateVC(viewController: UIViewController?, title: String, image: UIImage) -> UIViewController {
        
        guard let vc = viewController else {
            assertionFailure("Failed to create \(title)")
            return UIViewController()
        }
        
        vc.tabBarItem.title = title
        vc.tabBarItem.image = image
        
        let navController = UINavigationController(rootViewController: vc)
        
        return navController
    }
}
