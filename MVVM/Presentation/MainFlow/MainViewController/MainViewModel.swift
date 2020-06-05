//
//  MainViewModel.swift
//  MVVM
//
//  Created by Сираев Ильяс on 05.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MainViewModel {
	struct Input {
	}

	struct Output {
		let showPushScreen: Driver<Void>
		let showModalScreen: Driver<Void>
	}

	struct ViewActions {
		let tapShowPushScreenButton: PublishRelay<Void> = .init()
		let tapShowModalScreenButton: PublishRelay<Void> = .init()
	}

	struct ViewData {
		let pushButtonTitle: Driver<String>
		let modalButtonTitle: Driver<String>
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
			showPushScreen: viewActions.tapShowPushScreenButton.asDriver(),
			showModalScreen: viewActions.tapShowModalScreenButton.asDriver()
		)
	}

	private func createViewData() -> ViewData {
		.init(
			pushButtonTitle: .just("Show Push Screen"),
			modalButtonTitle: .just("Show Modal Screen")
		)
	}
}
