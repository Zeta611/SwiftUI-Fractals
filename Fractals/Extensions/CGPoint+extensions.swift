//
//  CGPoint+extensions.swift
//  Fractals
//
//  Created by Jay Lee on 2020/04/21.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import CoreGraphics

extension CGPoint {
    func offset(x: CGFloat = 0, y: CGFloat = 0) -> CGPoint {
        CGPoint(x: x + self.x, y: y + self.y)
    }

    func centeredConcyclic(radius: CGFloat, angle: CGFloat) -> CGPoint {
        offset(x: radius * cos(angle), y: radius * sin(angle))
    }
}
