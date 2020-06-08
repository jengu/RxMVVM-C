//
//  EditValueViewModel.swift
//  MVVM
//
//  Created by Vlad Maltsev on 08.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import RxSwift
import RxCocoa
import Foundation

class EditValueViewModel {
	struct Input {
		let value: BehaviorRelay<String?> = .init(value: nil)
	}

	struct Output {
		let value: Driver<String?>
	}

	struct ViewActions {
		let valueChanged: PublishRelay<String?> = .init()
		let tapSaveButton: PublishRelay<Void> = .init()
	}

	struct ViewData {
		let saveButtonTitle: Driver<String>
		let value: Driver<String?>
	}

	let input: Input = .init()
	lazy var output: Output = createOutput()
	let viewActions: ViewActions = .init()
	lazy var viewData: ViewData = createViewData()

	deinit {
		print("\(String(describing: self)): \(#function)")
	}

	private func createOutput() -> Output {
		let lastSavedValue = viewActions.tapSaveButton
			.withLatestFrom(viewActions.valueChanged)

		return Output(
			value: lastSavedValue.asDriverOnErrorJustComplete()
		)
	}

	private func createViewData() -> ViewData {
		.init(
			saveButtonTitle: .just("Save"),
			value: input.value.asDriver()
		)
	}
}
