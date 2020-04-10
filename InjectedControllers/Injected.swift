//
//  Injected.swift
//  InjectedControllers
//
//  Created by Calvin Morooney on 4/9/20.
//  Copyright © 2020 Pokol. All rights reserved.
//

import Foundation
import UIKit

protocol Injectable {
    var value: UIView? { get }
}

@propertyWrapper
struct Injected<Value: UIView>: Injectable {
    var value: UIView?
    
    var wrappedValue: Value {
        get {
            guard let value = self.value else {
                let name = Mirror.init(reflecting: self).description
                fatalError("Someone tried to access an @Injected view (\(name))before it was initialized.")
            }
            
            guard let castValue = value as? Value else {
                fatalError("Failed to inject \(value.self) as \(Value.self)")
            }
            
            return castValue
        }
        set {
            self.value = newValue
        }
    }
}
