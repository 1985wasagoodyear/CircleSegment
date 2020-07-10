//
//  LinkedList.swift
//  Created 7/8/20
//  Using Swift 5.0
// 
//  Copyright © 2020 yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation

final public class LinkedList<Type: CustomStringConvertible>: ListProtocol {
    public typealias Value = Type
    
    public var value: Type
    public var title: String?
    public var next: LinkedList<Type>?
    
    public init(_ value: Value,
                title: String? = nil,
                next: LinkedList? = nil) {
        self.value = value
        self.title = (title != nil) ? title : value.description
        self.next = next
    }
}
