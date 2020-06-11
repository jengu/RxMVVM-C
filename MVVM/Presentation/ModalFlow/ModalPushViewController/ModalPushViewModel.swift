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

class ModalPushViewModel: ModalPushViewModelProtocol {
	let input: ModalPushViewModelInput = .init()
	lazy var output: ModalPushViewModelOutput = createOutput()
	let viewActions: ModalPushViewModelViewActions = .init()
	lazy var viewData: ModalPushViewModelViewData = createViewData()

	deinit {
		print("\(String(describing: self)): \(#function)")
	}

	private func createOutput() -> ModalPushViewModelOutput {
		.init(
			openAnotherModal: viewActions.tapAnotherModalButton.asDriver()
		)
	}

	private func createViewData() -> ModalPushViewModelViewData {
		.init(
			anotherModalTitle: .just("Open another modal")
		)
	}
}
