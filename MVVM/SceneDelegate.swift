//
//  SceneDelegate.swift
//  MVVM
//
//  Created by Сираев Ильяс on 05.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	private var appCoordinator: AppCoordinator?
	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }

		let window = UIWindow(frame: UIScreen.main.bounds)
		let appCoordinator = AppCoordinator(presenter: WindowPresenter(window: window))
		appCoordinator.start()
		window.makeKeyAndVisible()
		window.windowScene = windowScene
		self.window = window
		self.appCoordinator = appCoordinator
	}
}
