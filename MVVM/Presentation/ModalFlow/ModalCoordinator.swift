//
//  ModalCoordinator.swift
//  MVVM
//
//  Created by Сираев Ильяс on 05.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ModalCoordinator: Coordinator<ModalNavigationPresenter> {
	override func start() {
		let viewController = createModalViewController()
		presenter.push(viewController)
	}

	private func createModalViewController() -> ModalViewController {
		let viewModel = ModalViewModel()
		viewModel.output.showPushScreen
			.drive(onNext: { [weak self] in
				self?.showPushViewController()
			})
			.disposed(by: bag)
		let viewController = ModalViewController(viewModel: viewModel)
		return viewController
	}

	private func showPushViewController() {
		let viewController = createModalPushViewController()
		presenter.push(viewController)
	}

	private func createModalPushViewController() -> ModalPushViewController {
		let viewModel = ModalPushViewModel()
		let viewController = ModalPushViewController(viewModel: viewModel)
		return viewController
	}
}
