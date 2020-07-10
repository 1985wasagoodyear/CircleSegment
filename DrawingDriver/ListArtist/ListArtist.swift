//
//  ListArtist.swift
//  Created 7/8/20
//  Using Swift 5.0
// 
//  Copyright © 2020 yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import UIKit

public struct ListArtist<Type: CustomStringConvertible> {
    
    public let list: LinkedList<Type>
    public let rules: DrawingNodeRules
    
    public init(list: LinkedList<Type>, rules: DrawingNodeRules) {
        self.list = list
        self.rules = rules
    }
    
    func drawView() -> UIView {
        var head: LinkedList<Type>? = list
        var nodeViews: [UIView] = []
        while let node = head {
            defer { head = node.next }
            let view = NodeLabel()
            view.title = node.title
            view.layer.borderColor = rules.borderColor
            view.layer.backgroundColor = rules.fillColor
            view.frame = CGRect.init(x: .zero, y: .zero,
                                     width: rules.radius, height: rules.radius)
            nodeViews.append(view)
        }
        print("Made \(nodeViews.count) views!")
        return nodeViews[0]
    }
    
}
