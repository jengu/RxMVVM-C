//
//  MainPushViewController.swift
//  MVVM
//
//  Created by Сираев Ильяс on 05.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import UIKit

class MainPushViewController: UIViewController {
	private let viewModel: MainPushViewModel

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
	}

	private func addSubviews() {
	}

	private func bindViewActions() {
	}

	private func bindViewData() {
	}
}
