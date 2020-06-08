//
//  NavigationPresenter.swift
//  MVVM
//
//  Created by Vlad Maltsev on 07.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import RxSwift
import UIKit

class ModalNavigationPresenter: Presenter {
	var closed: Observable<Void> {
		internalModalPresenter.closed
	}

	private var navigationPresented: Bool = false
	private let internalModalPresenter: ModalPresenter
	private weak var navigationController: UINavigationController?

	init(rootViewController: UIViewController) {
		internalModalPresenter = ModalPresenter(rootViewController: rootViewController)
	}

	func push(_ viewController: UIViewController) {
		if navigationPresented {
			navigationController?.pushViewController(viewController, animated: true)
		} else {
			let navigationController = UINavigationController(rootViewController: viewController)
			internalModalPresenter.present(navigationController)
			self.navigationController = navigationController
			navigationPresented = true
		}
	}

	func pop(to viewController: UIViewController) {
		navigationController?.popToViewController(viewController, animated: true)
	}

	func dismiss() {
		internalModalPresenter.dismiss()
	}

	func createModalPresenter() -> ModalPresenter? {
		navigationController.map { ModalPresenter(rootViewController: $0) }
	}

	func createNavigationPresenter() -> NavigationPresenter? {
		navigationController.map { NavigationPresenter(navigationController: $0) }
	}

	func createModalNavigationPresenter() -> ModalNavigationPresenter? {
		navigationController.map { ModalNavigationPresenter(rootViewController: $0) }
	}
}
