//
//  Injected.swift
//  InjectedControllers
//
//  Created by Calvin Morooney on 4/9/20.
//  Copyright © 2020 Pokol. All rights reserved.
//

import Foundation
import UIKit

@propertyWrapper
struct Injected<Value: UIView> {
    var value: Value?
    var wrappedValue: Value {
        get {
            guard let value = self.value else {
                fatalError("Property accessed before being initialized.")
            }
            return value
        }
        set {
            self.value = newValue
        }
    }
}
