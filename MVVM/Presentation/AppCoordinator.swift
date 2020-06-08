//
//  AppCoordinator.swift
//  MVVM
//
//  Created by Сираев Ильяс on 05.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator<WindowPresenter, Void> {
	override func start() {
		let navigationController = UINavigationController()
		presenter.setRootViewController(navigationController)
		let navigationPresenter = NavigationPresenter(navigationController: navigationController)
		coordinate(to: MainCoordinator(presenter: navigationPresenter))
	}
}
