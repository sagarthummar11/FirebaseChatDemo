//
//  UIColor.swift
//  FirebaseChatDemo
//
//  Created by sagar.thummar on 23/06/17.
//  Copyright © 2017 Solution Analysts Pvt. Ltd. All rights reserved.
//

import UIKit

extension UIColor {

    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}
