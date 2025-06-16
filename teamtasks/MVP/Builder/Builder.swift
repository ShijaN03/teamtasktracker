import UIKit

protocol BuilderProtocol: AnyObject {
    
    static func buildHomeView() -> UIViewController
}

class Builder: BuilderProtocol {
    
    static func buildHomeView() -> UIViewController {
        
        let view = HomeView()
        let presenter = HomePresenter(view: view)
        view.presenter = presenter
        
        return view
    }
    
    static func buildProfileView() -> UIViewController {
        
        let view = ProfileView()
        let presenter = ProfilePresenter(view: view)
        view.presenter = presenter
        
        return view 
    }
    
    static func buildTasksView() -> UIViewController {
        
        let view = TasksView()
        let presenter = TasksPresenter(view: view)
        view.presenter = presenter
        
        return view
    }
    
    static func buildChatView() -> UIViewController {
        
        let view = ChatView()
        let presenter = ChatPresenter(view: view)
        view.presenter = presenter
        
        return view
    }
    
    static func buildTeamView() -> UIViewController {
        
        let view = TeamView()
        let presenter = TeamPresenter(view: view)
        view.presenter = presenter
        
        return view
    }
    
    static func buildTaskInfoView(task: Task) -> UIViewController {
        
        let view = TaskInfoView()
        let presenter = TaskInfoPresenter(view: view, task: task)
        view.presenter = presenter
        
        return view
    }
    
    static func buildTabBarController() -> UITabBarController {
        
        let view = TabBarControllerView()
        let presenter = TabBarControllerPresenter(view: view)
        view.presenter = presenter
        
        return view
    }
    
}
