//
//  Presenter.swift
//  MVVM
//
//  Created by Vlad Maltsev on 07.06.2020.
//  Copyright © 2020 none. All rights reserved.
//

import RxSwift

protocol Presenter {
	var closed: Observable<Void> { get }
}
