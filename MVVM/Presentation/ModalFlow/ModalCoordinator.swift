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

class ModalCoordinator {
	private let disposeBag = DisposeBag()
	private let startViewController: UIViewController
	private let navigationController: UINavigationController = .init()

	deinit {
		print("\(String(describing: self)): \(#function)")
	}

	init(startViewController: UIViewController) {
		self.startViewController = startViewController
	}

	func start() {
		let viewController = createModalViewController()
		navigationController.viewControllers = [viewController]
		startViewController.present(navigationController, animated: true, completion: nil)
	}

	private func createModalViewController() -> ModalViewController {
		let viewModel = ModalViewModel()
		viewModel.output.showPushScreen
			.drive(onNext: { [weak self] in
				self?.showPushViewController()
			})
			.disposed(by: disposeBag)
		let viewController = ModalViewController(viewModel: viewModel)
		return viewController
	}

	private func showPushViewController() {
		let viewController = createModalPushViewController()
		navigationController.pushViewController(viewController, animated: true)
	}

	private func createModalPushViewController() -> ModalPushViewController {
		let viewModel = ModalPushViewModel()
		let viewController = ModalPushViewController(viewModel: viewModel)
		return viewController
	}
}
