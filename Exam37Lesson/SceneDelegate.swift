//
//  SceneDelegate.swift
//  Exam37Lesson
//
//  Created by user on 16.11.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let dataManager: IDataManager = DataManager()
        let viewController = ViewController()
        viewController.dataManager = dataManager
    
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }

}


extension SceneDelegate {
    
}
