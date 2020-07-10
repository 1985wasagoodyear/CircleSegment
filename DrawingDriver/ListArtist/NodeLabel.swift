//
//  NodeLabel.swift
//  Created 7/9/20
//  Using Swift 5.0
// 
//  Copyright © 2020 yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import UIKit

final class NodeLabel: UILabel {
    
    var title: String? = "" {
        didSet {
            attributedText = attributedTitleString
        }
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textAlignment = .center
        addCircleLayers()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        textAlignment = .center
        addCircleLayers()
    }
    
    // MARK: - Lifecycle Methods
    
    override func layoutIfNeeded() {
        redrawUI()
        super.layoutIfNeeded()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        redrawUI()
    }
    
    // MARK: - Drawing Functions
    
    private func addCircleLayers() {
        layer.masksToBounds = false
        layer.borderWidth = 5.0
        layer.cornerRadius = bounds.width / 2.0
    }
    
    private func redrawUI() {
        layer.cornerRadius = bounds.width / 2.0
    }
    
    var attributedTitleString: NSAttributedString? {
        guard let title = title, title.isEmpty == false else { return nil }
        let attributedStr = NSMutableAttributedString(string: title)
        return attributedStr
    }
    
}
