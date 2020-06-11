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

class MainPushViewModel: MainPushViewModelProtocol {
	let input: MainPushViewModelInput = .init()
	lazy var output: MainPushViewModelOutput = createOutput()
	let viewActions: MainPushViewModelViewActions = .init()
	lazy var viewData: MainPushViewModelViewData = createViewData()

	deinit {
		print("\(String(describing: self)): \(#function)")
	}

	private func createOutput() -> MainPushViewModelOutput {
		.init(
			pushAgain: viewActions.tapPushAgainButton.asDriver(),
			editValue: viewActions.tapEditValueButton.asDriver()
		)
	}

	private func createViewData() -> MainPushViewModelViewData {
		.init(
			pushAgainButtonTitle: .just("Push again"),
			editValueButtonTitle: .just("Edit value"),
			value: input.value.asDriverOnErrorJustComplete()
		)
	}
}
