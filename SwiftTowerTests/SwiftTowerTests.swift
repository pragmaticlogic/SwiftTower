//
//  SwiftTowerTests.swift
//  SwiftTowerTests
//
//  Created by Kevin Le on 10/19/14.
//  Copyright (c) 2014 CodePrototype. All rights reserved.
//

import UIKit
import XCTest
import SwiftTower

class SwiftTowerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // No extra setup code here.
    }
    
    override func tearDown() {
        // No extra teardown code here.
        super.tearDown()
    }
    
    func checkTower(dest:Stack<Int>, numberOfDisks:Int) -> Bool {
        var match = true
        var index = 1
        while match && dest.size() > 0 && index <= numberOfDisks {
            match = dest.pop() == index
            index++
        }
        return match
    }
    
    func testRecursiveTowerOfHanoi() {
        let numberOfDisks = 4
        let destStack:Stack<Int> = Stack<Int>()
        
        tower(numberOfDisks, source:.Tower1, dest:.Tower3 , temp:.Tower2, finalDest:.Tower3, destStack)
        XCTAssert(checkTower(destStack, numberOfDisks: numberOfDisks), "Pass")
    }
    
    func testInteractiveTowerOfHanoi() {
        let towerStacks: [Tower: Stack<Int>] = [.Tower1: Stack<Int>(), .Tower2: Stack<Int>(), .Tower3: Stack<Int>()]
        
        let numberOfDisks = 4
        for var index = numberOfDisks; index > 0; index-- {
            towerStacks[.Tower1]?.push(index)
        }
        
        towerInteractive(numberOfDisks, towerStacks) //results in tower 2 as the destination
        XCTAssert(checkTower(towerStacks[.Tower2]!, numberOfDisks: numberOfDisks), "Pass")
    }
}
