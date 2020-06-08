//
//  BaseCoordinator.swift
//  MVVM
//
//  Created by Vlad Maltsev on 07.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import RxSwift
import Foundation

class Coordinator<SomePresenter: Presenter> {
	private let identifier = UUID()
	private var childCoordinators: [UUID: Any] = [:]

	let bag = DisposeBag()
	let presenter: SomePresenter

	init(presenter: SomePresenter) {
		self.presenter = presenter
		print("\(String(describing: self)): \(#function)")
	}

	deinit {
		print("\(String(describing: self)): \(#function)")
	}

	func start() {
	}

	func coordinate<P>(to anotherCoordinator: Coordinator<P>) {
		let identifier = anotherCoordinator.identifier
		childCoordinators[identifier] = anotherCoordinator

		anotherCoordinator.presenter.closed
			.subscribe(
				onNext: { [weak self, identifier] in
					self?.childCoordinators[identifier] = nil
				}
			)
			.disposed(by: bag)

		anotherCoordinator.start()
	}
}
