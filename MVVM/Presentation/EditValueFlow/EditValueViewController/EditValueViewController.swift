//
//  EditValueViewController.swift
//  MVVM
//
//  Created by Vlad Maltsev on 08.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import RxSwift
import RxCocoa
import UIKit

class EditValueViewController: UIViewController {
	private let viewModel: EditValueViewModel
	private let disposeBag: DisposeBag = .init()
	private let saveButton: UIButton = .init()
	private let valueTextField: UITextField = .init()

	deinit {
		print("\(String(describing: self)): \(#function)")
	}

	init(viewModel: EditValueViewModel) {
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
		valueTextField.textAlignment = .center
		valueTextField.borderStyle = .line
		saveButton.setTitleColor(.black, for: .normal)
	}

	private func addSubviews() {
		valueTextField.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(valueTextField)
		NSLayoutConstraint.activate([
			valueTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			valueTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			valueTextField.widthAnchor.constraint(equalToConstant: 300)
		])

		saveButton.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(saveButton)
		NSLayoutConstraint.activate([
			saveButton.topAnchor.constraint(equalTo: valueTextField.bottomAnchor),
			saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	}

	private func bindViewActions() {
		saveButton.rx.tap
			.map { [weak self] in self?.valueTextField.text }
			.bind(to: viewModel.viewActions.savedValue)
			.disposed(by: disposeBag)
	}

	private func bindViewData() {
		viewModel.viewData.saveButtonTitle
			.drive(saveButton.rx.title(for: .normal))
			.disposed(by: disposeBag)

		viewModel.viewData.value
			.drive(valueTextField.rx.text)
			.disposed(by: disposeBag)
	}
}
