//
//  NavigationPresenter.swift
//  MVVM
//
//  Created by Vlad Maltsev on 07.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import RxSwift
import UIKit

class NavigationPresenter: Presenter {
	private let dismissSubject = PublishSubject<Void>()
	private let presentationDelegate = NavigationPresentationDelegate()

	var closed: Observable<Void> {
		dismissSubject.asObserver()
	}

	private weak var navigationController: UINavigationController?
	private weak var initialViewController: UIViewController?

	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
		navigationController.delegate = presentationDelegate
		if let initialViewController = navigationController.topViewController {
			self.initialViewController = initialViewController
			presentationDelegate.addObserverOnDidShow(of: initialViewController) { [dismissSubject] in
				dismissSubject.onNext(())
			}
		}
	}

	func push(_ viewController: UIViewController) {
		navigationController?.pushViewController(viewController, animated: true)
	}

	func pop(to viewController: UIViewController) {
		navigationController?.popToViewController(viewController, animated: true)
	}

	func popToInitial() {
		guard let initialViewController = initialViewController else { return }

		navigationController?.popToViewController(initialViewController, animated: true)
	}

	func createModalPresenter() -> ModalPresenter? {
		navigationController.map { ModalPresenter(rootViewController: $0) }
	}

	func createModalNavigationPresenter() -> ModalNavigationPresenter? {
		navigationController.map { ModalNavigationPresenter(rootViewController: $0) }
	}

	func createNavigationPresenter() -> NavigationPresenter? {
		navigationController.map { NavigationPresenter(navigationController: $0) }
	}
}

private class NavigationPresentationDelegate: NSObject, UINavigationControllerDelegate {
	private struct NavigationDidShowObserving {
		weak var viewController: UIViewController?
		let onDidShow: () -> Void
	}

	private var observings: [NavigationDidShowObserving] = []

	func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
		observings.forEach { observing in
			if observing.viewController == viewController {
				observing.onDidShow()
			}
		}
	}

	func addObserverOnDidShow(of viewController: UIViewController, action: @escaping () -> Void) {
		observings.append(NavigationDidShowObserving(viewController: viewController, onDidShow: action))
	}
}
