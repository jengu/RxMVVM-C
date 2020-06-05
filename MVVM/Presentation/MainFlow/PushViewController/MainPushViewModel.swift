//
//  MainPushViewModel.swift
//  MVVM
//
//  Created by Сираев Ильяс on 05.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation

class MainPushViewModel {
	struct Input {
	}

	struct Output {
	}

	struct ViewActions {
	}

	struct ViewData {
	}

	let input: Input = .init()
	lazy var output: Output = createOutput()
	let viewActions: ViewActions = .init()
	lazy var viewData: ViewData = createViewData()

	deinit {
		print("\(String(describing: self)): \(#function)")
	}

	private func createOutput() -> Output {
		.init()
	}

	private func createViewData() -> ViewData {
		.init()
	}
}
