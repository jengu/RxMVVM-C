//
//  ModalPushViewController.swift
//  MVVM
//
//  Created by Сираев Ильяс on 05.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ModalPushViewController: UIViewController {
	private let viewModel: ModalPushViewModelViewActionsAndData
	private let disposeBag: DisposeBag = .init()
	private let openAnotherModalButton: UIButton = .init()

	deinit {
		print("\(String(describing: self)): \(#function)")
	}

	init(viewModel: ModalPushViewModelViewActionsAndData) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		configure()
		addSubviews()
		bindViewActions()
		bindViewData()
	}

	private func configure() {
		title = "Modal Push Screen"
		view.backgroundColor = .white
		openAnotherModalButton.setTitleColor(.black, for: .normal)
	}

	private func addSubviews() {
		openAnotherModalButton.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(openAnotherModalButton)
		NSLayoutConstraint.activate([
			openAnotherModalButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			openAnotherModalButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
	}

	private func bindViewActions() {
		openAnotherModalButton.rx.tap.asObservable()
			.bind(to: viewModel.viewActions.tapAnotherModalButton)
			.disposed(by: disposeBag)
	}

	private func bindViewData() {
		viewModel.viewData.anotherModalTitle
			.drive(openAnotherModalButton.rx.title(for: .normal))
			.disposed(by: disposeBag)
	}
}
