//
//  PushFlow.swift
//  MVVM
//
//  Created by Vlad Maltsev on 08.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation
import RxSwift

class PushCoordinator: Coordinator<NavigationPresenter, Void> {
	private let valueRelay: BehaviorSubject<String?> = .init(value: "Some")

	override func start() {
		let viewController = createPushViewController()
		presenter.push(viewController)
	}

	private func createPushViewController() -> MainPushViewController {
		let viewModel = MainPushViewModel()

		valueRelay.asObserver()
			.bind(to: viewModel.input.value)
			.disposed(by: bag)

		viewModel.output.pushAgain
			.drive(onNext: { [weak self] in
				self?.showAnotherPushFlow()
			})
			.disposed(by: bag)

		viewModel.output.editValue
			.drive(onNext: { [weak self] in
				self?.showEditValue()
			})
			.disposed(by: bag)

		let viewController = MainPushViewController(viewModel: viewModel)
		return viewController
	}

	private func showEditValue() {
		guard let presenter = presenter.createModalPresenter() else { return }
		let output = coordinate(to: EditValueCoordinator(presenter: presenter))
		output.value.bind(to: valueRelay).disposed(by: bag)
	}

	private func showAnotherPushFlow() {
		guard let presenter = presenter.createNavigationPresenter() else { return }
		coordinate(to: PushCoordinator(presenter: presenter))
	}
}
