//
//  CGRect+extensions.swift
//  Fractals
//
//  Created by Jay Lee on 2020/04/21.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import CoreGraphics

extension CGRect {
    var localCenter: CGPoint { CGPoint(x: width / 2, y: height / 2) }
    var minSide: CGFloat { min(width, height) }
}
