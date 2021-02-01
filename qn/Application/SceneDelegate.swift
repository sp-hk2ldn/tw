//
//  SceneDelegate.swift
//  qn
//
//  Created by Stephen Parker on 28/1/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    lazy var coordinator: Coordinator = SceneDelegate.mainCoordinator()

    static func mainCoordinator() -> Coordinator {
        let navigationController = UINavigationController()
        return MainCoordinator(navigationController: navigationController)
    }
    ///Creates the Main Coordinator and kicks the application flow off
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let appWindow = UIWindow(frame: windowScene.coordinateSpace.bounds)
        appWindow.windowScene = windowScene
        coordinator.start()
        appWindow.rootViewController = coordinator.navigationController
        appWindow.makeKeyAndVisible()
        window = appWindow
    }
}
