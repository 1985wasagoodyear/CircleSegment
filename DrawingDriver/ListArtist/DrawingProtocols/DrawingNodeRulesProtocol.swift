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
