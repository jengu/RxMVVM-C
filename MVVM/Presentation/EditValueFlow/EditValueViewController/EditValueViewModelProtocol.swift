//
//  EditValueViewModelProtocol.swift
//  MVVM
//
//  Created by Сираев Ильяс on 11.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct EditValueViewModelInput {
	let value: BehaviorRelay<String?> = .init(value: nil)
}

struct EditValueViewModelOutput {
	let value: Driver<String?>
}

struct EditValueViewModelViewActions {
	let savedValue: PublishRelay<String?> = .init()
}

struct EditValueViewModelViewData {
	let saveButtonTitle: Driver<String>
	let value: Driver<String?>
}

protocol EditValueViewModelInputOutput {
	var input: EditValueViewModelInput { get }
	var output: EditValueViewModelOutput { get }
}

protocol EditValueViewModelViewActionsAndData {
	var viewActions: EditValueViewModelViewActions { get }
	var viewData: EditValueViewModelViewData { get }
}

typealias EditValueViewModelProtocol = EditValueViewModelInputOutput & EditValueViewModelViewActionsAndData
