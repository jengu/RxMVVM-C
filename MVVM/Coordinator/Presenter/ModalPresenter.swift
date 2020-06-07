//
//  ModalPresenter.swift
//  MVVM
//
//  Created by Vlad Maltsev on 07.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import RxSwift
import RxCocoa
import UIKit

class ModalPresenter: Presenter {
	private let dismissSubject = PublishSubject<Void>()

	var closed: Observable<Void> {
		dismissSubject.asObserver()
	}

	private weak var rootViewController: UIViewController?
	private weak var presentedViewController: UIViewController?
	private lazy var presentationDelegate: PresentationDelegate = {
		PresentationDelegate { [weak self] in
			self?.dismissSubject.onNext(())
		}
	}()

	init(rootViewController: UIViewController) {
		self.rootViewController = rootViewController
	}

	func present(_ viewController: UIViewController) {
		presentedViewController = viewController
		rootViewController?.present(viewController, animated: true, completion: nil)
		viewController.presentationController?.delegate = presentationDelegate
	}

	func dismiss() {
		presentedViewController?.dismiss(animated: true, completion: nil)
		dismissSubject.onNext(())
	}

	func createModalPresenter() -> ModalPresenter? {
		presentedViewController.map { ModalPresenter(rootViewController: $0) }
	}
}

private class PresentationDelegate: NSObject, UIAdaptivePresentationControllerDelegate {
	let onDismiss: () -> Void

	init(onDismiss: @escaping () -> Void) {
		self.onDismiss = onDismiss
	}

	func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
		onDismiss()
	}
}
