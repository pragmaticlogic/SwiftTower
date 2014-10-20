//
//  SwiftTowerTestStack.swift
//  SwiftTower
//
//  Created by Kevin Le on 10/19/14.
//  Copyright (c) 2014 CodePrototype. All rights reserved.
//

import UIKit
import XCTest

class SwiftTowerTestStack: XCTestCase {

    let stack:Stack<Int> = Stack<Int>()
    
    override func setUp() {
        super.setUp()        // No extra setup code here.
    }
    
    override func tearDown() {
        // No extra teardown code here.
        super.tearDown()
    }

    func testPushPopOperations() {
        //Push 5 pieces of data
        for index in 1 ... 5 {
            stack.push(index)
        }
        
        //Pop the current top
        XCTAssert(stack.pop() == 5, "Pass")
        XCTAssert(stack.pop() == 4, "Pass")
        XCTAssert(stack.pop() == 3, "Pass")
        XCTAssert(stack.pop() == 2, "Pass")
        XCTAssert(stack.pop() == 1, "Pass")
        
        //Nothing left, stack should be empty
        XCTAssert(stack.isEmty(), "Pass")
    }
    
    func testOtherOperations() {
        // Initial state of stack should be empty
        XCTAssert(stack.isEmty(), "Pass")
        
        //Push 5 pieces of data
        for index in 1 ... 5 {
            stack.push(index)
        }
        
        XCTAssert(stack.size() == 5, "Pass")
        
        //Top of stack should be 5
        XCTAssert(stack.peek() == 5, "Pass")
    }
}
