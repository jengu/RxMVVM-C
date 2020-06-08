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
	}

	struct Output {
		let pushAgain: Driver<Void>
	}

	struct ViewActions {
		let tapPushAgainButton: PublishRelay<Void> = .init()
	}

	struct ViewData {
		let pushAgainButtonTitle: Driver<String>
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
			pushAgain: viewActions.tapPushAgainButton.asDriver()
		)
	}

	private func createViewData() -> ViewData {
		.init(
			pushAgainButtonTitle: .just("Push again")
		)
	}
}
