//
//  MainViewModelProtocol.swift
//  MVVM
//
//  Created by Сираев Ильяс on 11.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct MainViewModelInput {
}

struct MainViewModelOutput {
	let showPushScreen: Driver<Void>
	let showModalScreen: Driver<Void>
}

struct MainViewModelViewActions {
	let tapShowPushScreenButton: PublishRelay<Void> = .init()
	let tapShowModalScreenButton: PublishRelay<Void> = .init()
}

struct MainViewModelViewData {
	let pushButtonTitle: Driver<String>
	let modalButtonTitle: Driver<String>
}

protocol MainViewModelInputOutput {
	var input: MainViewModelInput { get }
	var output: MainViewModelOutput { get }
}

protocol MainViewModelViewActionsAndData {
	var viewActions: MainViewModelViewActions { get }
	var viewData: MainViewModelViewData { get }
}

typealias MainViewModelProtocol = MainViewModelInputOutput & MainViewModelViewActionsAndData
