//
//  SceneDelegate.swift
//  Home Screen Quick Actions
//
//  Created by Bhanuteja on 14/04/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if let shortcutItem = connectionOptions.shortcutItem {
            HomeScreenQuickActionsModel.shared.handleQuickActionTap(shortcutItem, window: self.window!)
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }

    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem,
                     completionHandler: @escaping (Bool) -> Void) {
        HomeScreenQuickActionsModel.shared.handleQuickActionTap(shortcutItem, window: self.window!)
    }
}
