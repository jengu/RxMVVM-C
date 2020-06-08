//
//  MainPushViewController.swift
//  MVVM
//
//  Created by Сираев Ильяс on 05.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import RxSwift
import RxCocoa
import UIKit

class MainPushViewController: UIViewController {
	private let viewModel: MainPushViewModel
	private let disposeBag: DisposeBag = .init()
	private let pushAgainButton: UIButton = .init()
	private let valueLabel: UILabel = .init()
	private let editValueButton: UIButton = .init()

	deinit {
		print("\(String(describing: self)): \(#function)")
	}

	init(viewModel: MainPushViewModel) {
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
		title = "Push Screen"
		view.backgroundColor = .white
		pushAgainButton.setTitleColor(.black, for: .normal)
		editValueButton.setTitleColor(.black, for: .normal)
	}

	private func addSubviews() {
		pushAgainButton.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(pushAgainButton)
		NSLayoutConstraint.activate([
			pushAgainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			pushAgainButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])

		editValueButton.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(editValueButton)
		NSLayoutConstraint.activate([
			editValueButton.bottomAnchor.constraint(equalTo: pushAgainButton.topAnchor, constant: -40),
			editValueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])

		valueLabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(valueLabel)
		NSLayoutConstraint.activate([
			valueLabel.bottomAnchor.constraint(equalTo: editValueButton.topAnchor),
			valueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	}

	private func bindViewActions() {
		pushAgainButton.rx.tap.asObservable()
			.bind(to: viewModel.viewActions.tapPushAgainButton)
			.disposed(by: disposeBag)

		editValueButton.rx.tap.asObservable()
			.bind(to: viewModel.viewActions.tapEditValueButton)
			.disposed(by: disposeBag)
	}

	private func bindViewData() {
		viewModel.viewData.pushAgainButtonTitle
			.drive(pushAgainButton.rx.title(for: .normal))
			.disposed(by: disposeBag)

		viewModel.viewData.editValueButtonTitle
			.drive(editValueButton.rx.title(for: .normal))
			.disposed(by: disposeBag)

		viewModel.viewData.value
			.debug("🐠 viewData")
			.map { $0 ?? "Nothing" }
			.drive(valueLabel.rx.text)
			.disposed(by: disposeBag)
	}
}
