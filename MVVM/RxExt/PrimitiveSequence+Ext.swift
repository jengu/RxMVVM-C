//
//  PrimitiveSequence+Ext.swift
//  SquareMeter
//
//  Created by Fumin Vladimir on 22.01.2020.
//  Copyright © 2020 m2. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public extension PrimitiveSequence {

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
}
