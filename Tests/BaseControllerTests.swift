//
//  BaseControllerTests.swift
//  Tests
//
//  Created by Calvin Morooney on 4/10/20.
//  Copyright © 2020 Pokol. All rights reserved.
//

import XCTest
import UIKit
@testable import InjectedControllers

//CANDIDATE - pull up to core
class BaseControllerTests<Controller: UIViewController>: XCTestCase {
    var controller: Controller!
    
    private func instantiateAndRunControllerLifecycle() {
        controller = Controller()
        testInjectedViewsNotInstantiated()
        controller.loadView()
        controller.viewDidLoad()
    }
    
    override func setUp() {
        super.setUp()
        instantiateAndRunControllerLifecycle()
    }
    
    override func tearDown() {
        controller = nil
        super.tearDown()
    }
    
    func testControllerNotNil() {
        XCTAssertNotNil(controller, "Controller is nil")
    }
    
    //we're gonna call this explicitly before loadView is called on the controller, warning can be ignored
    //swiftlint:disable:next private_unit_test
    private func testInjectedViewsNotInstantiated() {
        testInjectedViews { XCTAssertNil($0.value) }
    }
    
    func testInjectedViewsInstantiated() {
        testInjectedViews { XCTAssertNotNil($0.value) }
    }
    
    private func testInjectedViews(test: (Injectable) -> Void) {
        for child in Mirror(reflecting: controller!).children {
            if let injectedChild = child.value as? Injectable {
                test(injectedChild)
            }
        }
    }
}
