//
//  Polygon.swift
//  Fractals
//
//  Created by Jay Lee on 2020/04/21.
//  Copyright © 2020 Jay Lee. All rights reserved.
//
//  Adapted from https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798
//

import SwiftUI

struct Polygon: Shape {
    var sides: Int

    func path(in rect: CGRect) -> Path {
        let hypotenuse = CGFloat(min(rect.size.width, rect.size.height)) / 2
        let center = CGPoint(x: rect.size.width / 2, y: rect.size.height / 2)

        var path = Path()
        for i in 0..<sides {
            let angle = CGFloat(i) * 2 * .pi / CGFloat(sides)
            let point = CGPoint(
                x: center.x + cos(angle) * hypotenuse,
                y: center.y + sin(angle) * hypotenuse
            )
            if i == 0 {
                // move to the first vertex
                path.move(to: point)
            } else {
                // draw line to the next vertex
                path.addLine(to: point)
            }
        }
        path.closeSubpath()
        return path
    }
}
