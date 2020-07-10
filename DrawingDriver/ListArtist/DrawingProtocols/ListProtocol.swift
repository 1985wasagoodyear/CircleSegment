//
//  ListProtocol.swift
//  Created 7/8/20
//  Using Swift 5.0
// 
//  Copyright © 2020 yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation

public protocol ListProtocol: AnyObject {
    associatedtype Value: CustomStringConvertible
    
    var value: Value { get }
    var title: String { get }
    var next: Self? { get }
}

extension ListProtocol {
    public var title: String {
        return value.description
    }
}
