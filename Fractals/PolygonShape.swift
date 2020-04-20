//
//  PolygonShape.swift
//  Fractals
//
//  Created by Jay Lee on 2020/04/21.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

struct Polygon: Shape {
    var sides: Int

    func path(in rect: CGRect) -> Path {
        // hypotenuse
        let h = Double(min(rect.size.width, rect.size.height)) / 2.0

        // center
        let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)

        var path = Path()
        for i in 0..<sides {
            let angle = (Double(i) * (360.0 / Double(sides))) * Double.pi / 180

            // Calculate vertex position
            let point = CGPoint(
                x: c.x + CGFloat(cos(angle) * h),
                y: c.y + CGFloat(sin(angle) * h)
            )

            if i == 0 {
                path.move(to: point) // move to first vertex
            } else {
                path.addLine(to: point) // draw line to next vertex
            }
        }

        path.closeSubpath()
        return path
    }
}
