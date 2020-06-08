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

class MainCoordinator: Coordinator<NavigationPresenter, Void> {

	override func start() {
		let viewController = createMainViewController()
		presenter.push(viewController)
	}

	private func createMainViewController() -> MainViewController {
		let viewModel = MainViewModel()
		viewModel.output.showPushScreen
			.drive(onNext: { [weak self] in
				self?.showPushFlow()
			})
			.disposed(by: bag)
		viewModel.output.showModalScreen
			.drive(onNext: { [weak self] in
				self?.showModalFlow()
			})
			.disposed(by: bag)
		let viewController = MainViewController(viewModel: viewModel)
		return viewController
	}

	private func showPushFlow() {
		guard let presenter = presenter.createNavigationPresenter() else { return }
		coordinate(to: PushCoordinator(presenter: presenter))
	}

	private func showModalFlow() {
		guard let presenter = presenter.createModalNavigationPresenter() else { return }
		coordinate(to: ModalCoordinator(presenter: presenter))
	}
}
