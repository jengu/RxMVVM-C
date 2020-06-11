//
//  ModalViewController.swift
//  MVVM
//
//  Created by Сираев Ильяс on 05.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ModalViewController: UIViewController {
	private let viewModel: ModalViewModelViewActionsAndData
	private let disposeBag: DisposeBag = .init()
	private let showPushScreenButton: UIButton = .init()

	deinit {
		print("\(String(describing: self)): \(#function)")
	}

	init(viewModel: ModalViewModelViewActionsAndData) {
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
		title = "Modal Screen"
		view.backgroundColor = .white
		showPushScreenButton.setTitleColor(.black, for: .normal)
	}

	private func addSubviews() {
		showPushScreenButton.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(showPushScreenButton)

		NSLayoutConstraint.activate([
			showPushScreenButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 224),
			showPushScreenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
		])
	}

	private func bindViewActions() {
		showPushScreenButton.rx.tap
			.asObservable()
			.bind(to: viewModel.viewActions.tapShowPushScreenButton)
			.disposed(by: disposeBag)
	}

	private func bindViewData() {
		viewModel.viewData.pushButtonTitle
			.drive(showPushScreenButton.rx.title(for: .normal))
			.disposed(by: disposeBag)
	}
}
