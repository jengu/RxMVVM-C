//
//  MainPushViewModelProtocol.swift
//  MVVM
//
//  Created by Сираев Ильяс on 11.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct MainPushViewModelInput {
	let value: BehaviorRelay<String?> = .init(value: nil)
}

struct MainPushViewModelOutput {
	let pushAgain: Driver<Void>
	let editValue: Driver<Void>
}

struct MainPushViewModelViewActions {
	let tapPushAgainButton: PublishRelay<Void> = .init()
	let tapEditValueButton: PublishRelay<Void> = .init()
}

struct MainPushViewModelViewData {
	let pushAgainButtonTitle: Driver<String>
	let editValueButtonTitle: Driver<String>
	let value: Driver<String?>
}

protocol MainPushViewModelInputOutput {
	var input: MainPushViewModelInput { get }
	var output: MainPushViewModelOutput { get }
}

protocol MainPushViewModelViewActionsAndData {
	var viewActions: MainPushViewModelViewActions { get }
	var viewData: MainPushViewModelViewData { get }
}

typealias MainPushViewModelProtocol = MainPushViewModelInputOutput & MainPushViewModelViewActionsAndData
