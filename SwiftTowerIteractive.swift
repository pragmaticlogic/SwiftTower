//
//  SwiftTowerIteractive.swift
//  SwiftTower
//
//  Created by Kevin Le on 10/20/14.
//  Copyright (c) 2014 CodePrototype. All rights reserved.
//

import Foundation

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

func getTowerToMoveDiskTo(#towerWhere1Is:Tower, #towerWhereLastDiskMovedTo:Tower) -> Tower {
    switch (towerWhere1Is, towerWhereLastDiskMovedTo) {
        case (.Tower1, .Tower2), (.Tower2, .Tower1):
            return .Tower3
        case (.Tower1, .Tower3), (.Tower3, .Tower1):
            return .Tower2
        default:
            return .Tower1
    }
}

func towerInteractive(numberOfDisks: Int, towerStacks: [Tower: Stack<Int>]) {
    var towerWhere1Is = Tower.Tower1
    var towerWhereLastDiskMovedTo = Tower.Tower1
    
    
}








