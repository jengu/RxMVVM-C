//
//  EditValueCoordinator.swift
//  MVVM
//
//  Created by Vlad Maltsev on 08.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import RxSwift
import Foundation

class EditValueCoordinator: Coordinator<ModalPresenter, EditValueCoordinator.Output> {
	struct Input {
		let value: Observable<String?>
	}

	struct Output {
		let value: Observable<String?>
	}

	private let input: Input

	init(presenter: ModalPresenter, input: Input) {
		self.input = input
		super.init(presenter: presenter)
	}

	override func start() -> Output {
		let viewModel = EditValueViewModel()

		let viewController = EditValueViewController(viewModel: viewModel)
		presenter.present(viewController)

		input.value
			.bind(to: viewModel.input.value)
			.disposed(by: bag)

		viewModel.output.value.asObservable()
			.bind(onNext: { [weak self] _ in
				self?.presenter.dismiss()
			})
			.disposed(by: bag)

		return Output(
			value: viewModel.output.value.asObservable()
		)
	}
}
