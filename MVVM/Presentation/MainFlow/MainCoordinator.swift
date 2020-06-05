//
//  MainCoordinator.swift
//  MVVM
//
//  Created by Сираев Ильяс on 05.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainCoordinator {
	private let disposeBag = DisposeBag()
	private let navigationController: UINavigationController

	deinit {
		print("\(String(describing: self)): \(#function)")
	}

	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}

	func start() {
		navigationController.viewControllers = [createMainViewController()]
	}

	private func createMainViewController() -> MainViewController {
		let viewModel = MainViewModel()
		viewModel.output.showPushScreen
			.drive(onNext: { [weak self] in
				self?.showPushViewController()
			})
			.disposed(by: disposeBag)
		viewModel.output.showModalScreen
			.drive(onNext: { [weak self] in
				self?.showModalViewController()
			})
			.disposed(by: disposeBag)
		let viewController = MainViewController(viewModel: viewModel)
		return viewController
	}

	private func showPushViewController() {
		let viewController = createMainPushViewController()
		navigationController.pushViewController(viewController, animated: true)
	}

	private func createMainPushViewController() -> MainPushViewController {
		let viewModel = MainPushViewModel()
		let viewController = MainPushViewController(viewModel: viewModel)
		return viewController
	}

	private func showModalViewController() {
		let modalCoordinator = ModalCoordinator(startViewController: navigationController)
		modalCoordinator.start()
	}
}
