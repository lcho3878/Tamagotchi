//
//  SceneDelegate.swift
//  Tamagotchi
//
//  Created by 이찬호 on 6/7/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let vc = SelectViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }


}

