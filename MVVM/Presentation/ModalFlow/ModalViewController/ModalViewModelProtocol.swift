//
//  ModalViewModelProtocol.swift
//  MVVM
//
//  Created by Сираев Ильяс on 11.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct ModalViewModelInput {
}

struct ModalViewModelOutput {
	let showPushScreen: Driver<Void>
}

struct ModalViewModelViewActions {
	let tapShowPushScreenButton: PublishRelay<Void> = .init()
}

struct ModalViewModelViewData {
	let pushButtonTitle: Driver<String>
}

protocol ModalViewModelInputOutput {
	var input: ModalViewModelInput { get }
	var output: ModalViewModelOutput { get }
}

protocol ModalViewModelViewActionsAndData {
	var viewActions: ModalViewModelViewActions { get }
	var viewData: ModalViewModelViewData { get }
}

typealias ModalViewModelProtocol = ModalViewModelInputOutput & ModalViewModelViewActionsAndData
