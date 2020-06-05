//
//  MainViewController.swift
//  MVVM
//
//  Created by Сираев Ильяс on 05.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {
	private let viewModel: MainViewModel
	private let disposeBag: DisposeBag = .init()
	private let showPushScreenButton: UIButton = .init()
	private let showModalScreenButton: UIButton = .init()

	deinit {
		print("\(String(describing: self)): \(#function)")
	}

	init(viewModel: MainViewModel) {
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
		title = "Main Screen"
		view.backgroundColor = .white
		showPushScreenButton.setTitleColor(.black, for: .normal)
		showModalScreenButton.setTitleColor(.black, for: .normal)
	}

	private func addSubviews() {
		showPushScreenButton.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(showPushScreenButton)

		showModalScreenButton.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(showModalScreenButton)

		NSLayoutConstraint.activate([
			showPushScreenButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 224),
			showPushScreenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

			showModalScreenButton.topAnchor.constraint(equalTo: showPushScreenButton.bottomAnchor, constant: 32),
			showModalScreenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
		])
	}

	private func bindViewActions() {
		showPushScreenButton.rx.tap
			.asObservable()
			.bind(to: viewModel.viewActions.tapShowPushScreenButton)
			.disposed(by: disposeBag)
		showModalScreenButton.rx.tap
			.asObservable()
			.bind(to: viewModel.viewActions.tapShowModalScreenButton)
			.disposed(by: disposeBag)
	}

	private func bindViewData() {
		viewModel.viewData.pushButtonTitle
			.drive(showPushScreenButton.rx.title(for: .normal))
			.disposed(by: disposeBag)
		viewModel.viewData.modalButtonTitle
			.drive(showModalScreenButton.rx.title(for: .normal))
			.disposed(by: disposeBag)
	}
}
