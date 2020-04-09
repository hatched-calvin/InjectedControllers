//
//  BaseViewController.swift
//  InjectedControllers
//
//  Created by Calvin Morooney on 4/9/20.
//  Copyright © 2020 Pokol. All rights reserved.
//

import Foundation
import UIKit

protocol ViewInjector {
    func inject()
}

class BaseViewControllerBehavior: UIViewController {
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        injectViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        injectViews()
    }
    
    private func injectViews() {
        //swiftlint:disable:next force_cast
        (self as! ViewInjector).inject()
    }
}

typealias BaseViewController = BaseViewControllerBehavior & ViewInjector
