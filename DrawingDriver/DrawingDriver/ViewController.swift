//
//  ViewController.swift
//  Created 7/8/20
//  Using Swift 5.0
//
//  Copyright © 2020 yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rules = DrawingNodeRules(radius: 100.0,
                                     distance: 100.0,
                                     orientation: .vertical,
                                     borderColor: UIColor.black.cgColor,
                                     fillColor: UIColor.clear.cgColor)
        let list = LinkedList<Int>(1)
        list.next = LinkedList<Int>(2)
        list.next?.next = LinkedList<Int>(3)
        let artist = ListArtist(list: list, rules: rules)
        let view = artist.drawView()
        view.center = self.view.center
        self.view.addSubview(view)
    }
    
}
