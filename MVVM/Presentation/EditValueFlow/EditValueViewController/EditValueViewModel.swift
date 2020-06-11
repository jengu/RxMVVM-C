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

class EditValueViewModel: EditValueViewModelProtocol {
	let input: EditValueViewModelInput = .init()
	lazy var output: EditValueViewModelOutput = createOutput()
	let viewActions: EditValueViewModelViewActions = .init()
	lazy var viewData: EditValueViewModelViewData = createViewData()

	deinit {
		print("\(String(describing: self)): \(#function)")
	}

	private func createOutput() -> EditValueViewModelOutput {
		.init(
			value: viewActions.savedValue.asDriver()
		)
	}

	private func createViewData() -> EditValueViewModelViewData {
		.init(
			saveButtonTitle: .just("Save"),
			value: input.value.asDriver()
		)
	}
}
