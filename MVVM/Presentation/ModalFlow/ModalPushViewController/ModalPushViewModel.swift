//
//  ModalPushViewModel.swift
//  MVVM
//
//  Created by Сираев Ильяс on 05.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ModalPushViewModel {
	struct Input {
	}

	struct Output {
		let openAnotherModal: Driver<Void>
	}

	struct ViewActions {
		let tapAnotherModalButton: PublishRelay<Void> = .init()
	}

	struct ViewData {
		let anotherModalTitle: Driver<String>
	}

	let input: Input = .init()
	lazy var output: Output = createOutput()
	let viewActions: ViewActions = .init()
	lazy var viewData: ViewData = createViewData()

	deinit {
		print("\(String(describing: self)): \(#function)")
	}

	private func createOutput() -> Output {
		.init(
			openAnotherModal: viewActions.tapAnotherModalButton.asDriver()
		)
	}

	private func createViewData() -> ViewData {
		.init(
			anotherModalTitle: .just("Open another modal")
		)
	}
}
