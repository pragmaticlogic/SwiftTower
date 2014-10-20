//
//  SwiftTowerRecursive.swift
//  SwiftTower
//
//  Created by Kevin Le on 10/19/14.
//  Copyright (c) 2014 CodePrototype. All rights reserved.
//
//

import Foundation


enum Tower : String {
    case Tower1 = "Tower 1"
    case Tower2 = "Tower 2"
    case Tower3 = "Tower 3"
}

func tower(numberOfDisks: Int, source x: Tower, dest y: Tower, temp z: Tower, destStack:Stack<Int>) {
    if (numberOfDisks > 0) {
        tower(numberOfDisks - 1, source:x, dest:z, temp:y, destStack)
        println("Move disk \(numberOfDisks) from \(x.toRaw()) to \(y.toRaw())")
        if (x == .Tower3) {
            destStack.pop()
        } else if (y == .Tower3) {
            destStack.push(numberOfDisks)
        }
        tower(numberOfDisks - 1, source:z, dest:y, temp:x, destStack)
    }
}



