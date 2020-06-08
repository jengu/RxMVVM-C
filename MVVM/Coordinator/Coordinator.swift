//
//  BaseCoordinator.swift
//  MVVM
//
//  Created by Vlad Maltsev on 07.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import RxSwift
import Foundation

class Coordinator<SomePresenter: Presenter, FlowOutput> {
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

	func start() -> FlowOutput {
		fatalError("Abstract method")
	}

	func coordinate<P,O>(to anotherCoordinator: Coordinator<P,O>) -> O {
		let identifier = anotherCoordinator.identifier
		childCoordinators[identifier] = anotherCoordinator

		anotherCoordinator.presenter.closed
			.subscribe(
				onNext: { [weak self, identifier] in
					self?.childCoordinators[identifier] = nil
				}
			)
			.disposed(by: bag)

		return anotherCoordinator.start()
	}
}
