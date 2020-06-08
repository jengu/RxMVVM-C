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
		let savedValue: PublishRelay<String?> = .init()
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
		return Output(
			value: viewActions.savedValue.asDriver()
		)
	}

	private func createViewData() -> ViewData {
		.init(
			saveButtonTitle: .just("Save"),
			value: input.value.asDriver()
		)
	}
}
