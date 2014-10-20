//
//  SwiftTowerIteractive.swift
//  SwiftTower
//
//  Created by Kevin Le on 10/20/14.
//  Copyright (c) 2014 CodePrototype. All rights reserved.
//

import Foundation

enum ClockDirection {
    case Clockwise
    case CounterClockwise
}

enum DirectionOfDiskMoved {
    case ToTower
    case FromTower
}

func getDirection(#tower:Tower) -> (clockwiseTower: Tower, counterclockwiseTower: Tower) {
    switch tower {
    case .Tower1:
        return (.Tower2, .Tower3)
    case .Tower2:
        return (.Tower3, .Tower1)
    default:
        return (.Tower1, .Tower2)
    }
}

//if direction is FromTower, this func returns the non-empty stack or smaller top of the 2 stacks.  Stack is source
//if direction is ToTower, this func returns the empty stack or the larger top of the 2 stacks.  Stack is dest
func getStackSourceOrDest(towerA:Tower, towerB:Tower, towerStacks: [Tower: Stack<Int>], direction:DirectionOfDiskMoved) -> Tower {
    var stackA:Stack<Int> = towerStacks[towerA]!
    var stackB:Stack<Int> = towerStacks[towerB]!
    
    switch (direction) {
        case .FromTower:
            if (stackA.isEmty()) {
                return towerB
            } else if (stackB.isEmty()) {
                return towerA
            } else {
                return stackA.peek() < stackB.peek() ? towerA : towerB
        }
        default:
            if (stackA.isEmty()) {
                return towerA
            } else if (stackB.isEmty()) {
                return towerB
            } else {
                return stackA.peek() > stackB.peek() ? towerA : towerB
        }
    }
}

func getTowerWhereToGetDiskFrom(#referenceTower:Tower, towerStacks: [Tower: Stack<Int>]) -> Tower {
    switch (referenceTower) {
        case .Tower1:
            return getStackSourceOrDest(.Tower2, .Tower3, towerStacks, DirectionOfDiskMoved.FromTower)
        case .Tower2:
            return getStackSourceOrDest(.Tower1, .Tower3, towerStacks, DirectionOfDiskMoved.FromTower)
        default:
            return getStackSourceOrDest(.Tower1, .Tower2, towerStacks, DirectionOfDiskMoved.FromTower)
    }
}

func getTowerWhereToMoveDiskTo(#referenceTower:Tower, towerStacks: [Tower: Stack<Int>]) -> Tower {
    switch (referenceTower) {
    case .Tower1:
        return getStackSourceOrDest(.Tower2, .Tower3, towerStacks, DirectionOfDiskMoved.ToTower)
    case .Tower2:
        return getStackSourceOrDest(.Tower1, .Tower3, towerStacks, DirectionOfDiskMoved.ToTower)
    default:
        return getStackSourceOrDest(.Tower1, .Tower2, towerStacks, DirectionOfDiskMoved.ToTower)
    }
}

func towerInteractive(numberOfDisks: Int, towerStacks: [Tower: Stack<Int>]) {
    var towerWhere1Is = Tower.Tower1
    var directionToMoveTheNon1Disk = ClockDirection.Clockwise
    
    let iterations: Int = Int(pow(Double(2),Double(numberOfDisks))) - 1
    
    for index in 1 ... iterations {
        if (index % 2 == 1) {
            let stack:Stack<Int> = towerStacks[towerWhere1Is]!
            let (clockwiseTower: Tower, counterclockwiseTower: Tower) = getDirection(tower:towerWhere1Is)
            let newStack = towerStacks[counterclockwiseTower]!
            
            let disk1 = stack.pop()!
            newStack.push(disk1)
            
            println("Move \(disk1) from \(towerWhere1Is.toRaw()) to \(counterclockwiseTower.toRaw())")
            
            //update the tower where we move disk1 to
            towerWhere1Is = counterclockwiseTower
            
        } else {
            let towerWhereToGetDiskFrom = getTowerWhereToGetDiskFrom(referenceTower:towerWhere1Is, towerStacks)
            let stack:Stack<Int> = towerStacks[towerWhereToGetDiskFrom]!
            let disk = stack.pop()!
            
            let towerWhereToMoveDiskTo = getTowerWhereToMoveDiskTo(referenceTower:towerWhereToGetDiskFrom, towerStacks)
            let newStack = towerStacks[towerWhereToMoveDiskTo]!
            newStack.push(disk)
            
            println("Move \(disk) from \(towerWhereToGetDiskFrom.toRaw()) to \(towerWhereToMoveDiskTo.toRaw())")
            
            //update the direction to move non-1 disk
            directionToMoveTheNon1Disk = directionToMoveTheNon1Disk == .Clockwise ? .CounterClockwise : .Clockwise
        }
    }
}








