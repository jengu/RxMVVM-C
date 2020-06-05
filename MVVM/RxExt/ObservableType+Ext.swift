//
//  ObservableType+Ext.swift
//  SquareMeter
//
//  Created by Vladimir Shutov on 18.01.2020.
//  Copyright © 2020 ecosystem. All rights reserved.
//

import RxSwift
import RxCocoa

public extension ObservableType {

	/// Завершить стрим в случае ошибки
	func catchErrorJustComplete() -> Observable<Element> {
		catchError { _ in
			Observable.empty()
		}
	}

	/// Конвертация стрима в Driver trait.
	func asDriverOnErrorJustComplete() -> Driver<Element> {
		asDriver { _ in
			Driver.empty()
		}
	}

	/// Конвертация стрима в Signal trait.
	func asSignalOnErrorJustComplete() -> Signal<Element> {
		asSignal { _ in
			Signal.empty()
		}
	}

	/// Конвертация типа элемента стрима в Void
	func mapToVoid() -> Observable<Void> {
		map { _ in }
	}

	/// Конвертация стрима в новый стрим, который содержит предыдущее и текущее значения
	func withPrevious() -> Observable<(previous: Element?, current: Element)> {
		let tuple: (previous: Element?, current: Element?) = (nil, nil)

		return scan(tuple) { accumulator, current in
			(previous: accumulator.current, current: current)
		}
		.compactMap {
			guard let current = $0.current else { return nil }
			return ($0.previous, current)
		}
	}
}
