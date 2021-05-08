//
//  SceneDelegate.swift
//  AllApplesSV_iOS
//
//  Created by Mihaela Mihaljevic Jakic on 27.11.2020..
//

import UIKit
import AllApples

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let aScene = (scene as? UIWindowScene) else { return }
    window = AppSceneDelegate.makeWindow_iOS(theScene: aScene, theVC: MainSplitViewController())
  }

}

