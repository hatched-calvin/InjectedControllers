//
//  ViewController+UI.swift
//  InjectedControllers
//
//  Created by Calvin Morooney on 4/9/20.
//  Copyright © 2020 Pokol. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    override func loadView() {
        super.loadView()
        
        setupLabel()
    }
    
    func setupLabel() {
        label = UILabel()
        label.text = "Hello Injected World"
        view.addSubview(label)
    }
}
