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

class MainViewModel: MainViewModelProtocol {
	let input: MainViewModelInput = .init()
	lazy var output: MainViewModelOutput = createOutput()
	let viewActions: MainViewModelViewActions = .init()
	lazy var viewData: MainViewModelViewData = createViewData()

	deinit {
		print("\(String(describing: self)): \(#function)")
	}

	private func createOutput() -> MainViewModelOutput {
		.init(
			showPushScreen: viewActions.tapShowPushScreenButton.asDriver(),
			showModalScreen: viewActions.tapShowModalScreenButton.asDriver()
		)
	}

	private func createViewData() -> MainViewModelViewData {
		.init(
			pushButtonTitle: .just("Show Push Screen"),
			modalButtonTitle: .just("Show Modal Screen")
		)
	}
}
