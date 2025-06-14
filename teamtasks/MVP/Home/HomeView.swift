import UIKit

protocol HomeViewProtocol: AnyObject {
    
}

class HomeView: UIViewController, HomeViewProtocol {

    let containerView = UIView()
    let tabBar = UIView()
    let tapBarController = UITabBarController()
    
    var presenter: HomePresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpContainerView()
        setUpTabBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUpTabBarShape()
    }
    
    private func setUpContainerView() {
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setUpTabBar() {
        
        
        tabBarController?.viewControllers = [
            generateVC(viewController: Builder.buildTasksView(), title: "Tasks", image: UIImage(systemName: "list.bullet")!),
            generateVC(viewController: Builder.buildChatView(), title: "Chat", image: UIImage(systemName: "message")!),
            generateVC(viewController: Builder.buildProfileView(), title: "Profile", image: UIImage(systemName: "pesron.sircle")!)
        ]
        
        
        view.addSubview(tabBar)
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tabBar.heightAnchor.constraint(equalToConstant: 130)
        ])
        
    }
    
    private func setUpTabBarShape() {
        let layer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(roundedRect: CGRect(
            center: CGPoint(
                x: tabBar.bounds.width/2,
                y: tabBar.bounds.height/2),
            size: CGSize(
                width: 360,
                height: 80)),
                                      cornerRadius: 24)
        
        layer.path = bezierPath.cgPath
        layer.fillColor = UIColor.systemGray5.cgColor
        
        tabBar.layer.insertSublayer(layer, at: 0)
        
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        
        return viewController
    }
}
