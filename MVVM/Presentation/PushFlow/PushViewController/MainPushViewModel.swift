//
//  MainPushViewModel.swift
//  MVVM
//
//  Created by Сираев Ильяс on 05.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import RxSwift
import RxCocoa
import Foundation

class MainPushViewModel {
	struct Input {
		let value: PublishRelay<String?> = .init()
	}

	struct Output {
		let pushAgain: Driver<Void>
		let editValue: Driver<Void>
	}

	struct ViewActions {
		let tapPushAgainButton: PublishRelay<Void> = .init()
		let tapEditValueButton: PublishRelay<Void> = .init()
	}

	struct ViewData {
		let pushAgainButtonTitle: Driver<String>
		let editValueButtonTitle: Driver<String>
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
		.init(
			pushAgain: viewActions.tapPushAgainButton.asDriver(),
			editValue: viewActions.tapEditValueButton.asDriver()
		)
	}

	private func createViewData() -> ViewData {
		.init(
			pushAgainButtonTitle: .just("Push again"),
			editValueButtonTitle: .just("Edit value"),
			value: input.value.debug("🐠 ViewData.value").asDriverOnErrorJustComplete()
		)
	}
}
