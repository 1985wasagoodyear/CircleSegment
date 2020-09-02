//
//  DrawingNodeRulesProtocol.swift
//  Created 7/8/20
//  Using Swift 5.0
// 
//  Copyright © 2020 yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import CoreGraphics

public enum DrawingNodeOrientation {
    case horizontal
    case vertical
}

public struct DrawingNodeRules {
    let radius: CGFloat
    let distance: CGFloat
    let orientation: DrawingNodeOrientation
    let borderColor: CGColor
    let fillColor: CGColor
}

// https://github.com/gavinalt
/*
protocol LinkedList {
    associatedtype ListNode: Node
    
    var head: ListNode? { get }
    var tail: ListNode? { get }
    
    func append(_ value: ListNode.Value)
}

protocol Node {
    associatedtype Value
    associatedtype NeighboringNode: Node where NeighboringNode.Value == Value
    
    var value: Value  { get set }
    var next: NeighboringNode?  { get }
}

protocol DoublyNode: Node where NeighboringNode: DoublyNode {
    var previous: NeighboringNode?  { get }
}

class SinglyLinkedList<T>: LinkedList {
    var head: SinglyNode<T>?
    var tail: SinglyNode<T>?
    
    func append(_ value: T) { }
}

class SinglyNode<T>: Node {
    var value: T
    var next: SinglyNode<T>?
    
    init(value: T) {
        self.value = value
    }
}
*/
