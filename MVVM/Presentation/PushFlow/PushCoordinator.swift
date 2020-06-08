//
//  PushFlow.swift
//  MVVM
//
//  Created by Vlad Maltsev on 08.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation

class PushCoordinator: Coordinator<NavigationPresenter, Void> {
	override func start() {
		let viewController = createPushViewController()
		presenter.push(viewController)
	}

	private func createPushViewController() -> MainPushViewController {
		let viewModel = MainPushViewModel()
		viewModel.output.pushAgain
			.drive(
				onNext: { [weak self] in
					self?.showAnotherPushFlow()
				}
			)
			.disposed(by: bag)
		let viewController = MainPushViewController(viewModel: viewModel)
		return viewController
	}

	private func showAnotherPushFlow() {
		guard let presenter = presenter.createNavigationPresenter() else { return }
		coordinate(to: PushCoordinator(presenter: presenter))
	}
}
