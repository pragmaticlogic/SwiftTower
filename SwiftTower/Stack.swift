//
//  Stack.swift
//  SwiftTower
//
//  Created by Kevin Le on 10/19/14.
//  Copyright (c) 2014 CodePrototype. All rights reserved.
//

import Foundation

class Node<T> {
    var key: T? = nil
    var next: Node? = nil
}

public class Stack<T> {
    private var N:Int = 0
    private var top: Node<T>! = nil
    
    public func size() -> Int {
        return N
    }
    
    public func isEmty() -> Bool {
        return top === nil
    }
    
    public func peek() -> T? {
        return top.key
    }
    
    public func push(key:T) {
        let current:Node<T>! = top
        top = Node<T>()
        top.key = key
        top.next = current
        N++
    }
    
    public func pop() -> T? {
        let item:T? = top.key
        top = top.next
        N--
        return item
    }
}



