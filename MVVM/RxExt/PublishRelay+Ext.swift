//
//  PublishRelay+Ext.swift
//  SquareMeter
//
//  Created by Vladimir Shutov on 20.01.2020.
//  Copyright © 2020 ecosystem. All rights reserved.
//

import RxSwift
import RxRelay
import RxCocoa
import Foundation

internal extension PublishRelay {

	func asDriver() -> Driver<Element> {
		asDriverOnErrorJustComplete()
	}
}
