//
//  ModalPushViewModelProtocol.swift
//  MVVM
//
//  Created by Сираев Ильяс on 11.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct ModalPushViewModelInput {
}

struct ModalPushViewModelOutput {
	let openAnotherModal: Driver<Void>
}

struct ModalPushViewModelViewActions {
	let tapAnotherModalButton: PublishRelay<Void> = .init()
}

struct ModalPushViewModelViewData {
	let anotherModalTitle: Driver<String>
}

protocol ModalPushViewModelInputOutput {
	var input: ModalPushViewModelInput { get }
	var output: ModalPushViewModelOutput { get }
}

protocol ModalPushViewModelViewActionsAndData {
	var viewActions: ModalPushViewModelViewActions { get }
	var viewData: ModalPushViewModelViewData { get }
}

typealias ModalPushViewModelProtocol = ModalPushViewModelInputOutput & ModalPushViewModelViewActionsAndData
