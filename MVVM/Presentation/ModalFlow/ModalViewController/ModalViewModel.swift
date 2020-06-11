//
//  ModalViewModel.swift
//  MVVM
//
//  Created by Сираев Ильяс on 05.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ModalViewModel: ModalViewModelProtocol {
	let input: ModalViewModelInput = .init()
	lazy var output: ModalViewModelOutput = createOutput()
	let viewActions: ModalViewModelViewActions = .init()
	lazy var viewData: ModalViewModelViewData = createViewData()

	deinit {
		print("\(String(describing: self)): \(#function)")
	}

	private func createOutput() -> ModalViewModelOutput {
		.init(
			showPushScreen: viewActions.tapShowPushScreenButton.asDriver()
		)
	}

	private func createViewData() -> ModalViewModelViewData {
		.init(
			pushButtonTitle: .just("Show Push Screen")
		)
	}
}
