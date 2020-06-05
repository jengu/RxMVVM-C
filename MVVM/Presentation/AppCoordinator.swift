//
//  AppCoordinator.swift
//  MVVM
//
//  Created by Сираев Ильяс on 05.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import UIKit

class AppCoordinator {
	private let window: UIWindow
	private let navigationController: UINavigationController = .init()

	deinit {
		print("\(String(describing: self)): \(#function)")
	}

	init(window: UIWindow) {
		self.window = window
		window.rootViewController = navigationController
	}

	func start() {
		let mainCoordinator = MainCoordinator(navigationController: navigationController)
		mainCoordinator.start()
	}
}
