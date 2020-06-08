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
	struct Output {
		let value: Observable<String?>
	}

	override func start() -> Output {
		let viewModel = EditValueViewModel()

		let viewController = EditValueViewController(viewModel: viewModel)
		presenter.present(viewController)

		let outputValue = viewModel.output.value.asObservable()
			.do(afterNext: { [weak self] _ in
				self?.presenter.dismiss()
			})

		return Output(
			value: outputValue
		)
	}
}
