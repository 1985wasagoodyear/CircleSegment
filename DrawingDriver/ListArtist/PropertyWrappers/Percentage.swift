//
//  Percentage.swift
//  Created 7/7/20
//  Using Swift 5.0
// 
//  Copyright © 2020 yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation

@propertyWrapper
struct Percentage<FloatingPoint: BinaryFloatingPoint> {
    var value: FloatingPoint
    var wrappedValue: FloatingPoint {
        get { value }
        set { value = Percentage.bound(newValue) }
    }
    init(wrappedValue value: FloatingPoint) {
        self.value = Percentage.bound(value)
    }
    
    static private func bound(_ newValue: FloatingPoint) -> FloatingPoint {
        switch newValue {
        case let value where value < 0.0:
            return 0.0
        case let value where value > 100.0:
            return 100.0
        default:
            return newValue
        }
    }
}
