//
//  WindowPresenter.swift
//  MVVM
//
//  Created by Vlad Maltsev on 07.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import RxSwift
import UIKit

class WindowPresenter: Presenter {
	private let window: UIWindow

	var closed: Observable<Void> {
		.never()
	}

	init(window: UIWindow) {
		self.window = window
	}

	func setRootViewController(_ viewController: UIViewController) {
		window.rootViewController = viewController
	}
}
