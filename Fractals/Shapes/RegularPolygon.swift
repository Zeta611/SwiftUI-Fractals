//
//  RegularPolygon.swift
//  Fractals
//
//  Created by Jay Lee on 2020/04/21.
//  Copyright © 2020 Jay Lee. All rights reserved.
//
//  Adapted from https://gist.github.com/swiftui-lab/e5901123101ffad6d39020cc7a810798
//

import SwiftUI

struct RegularPolygon: Shape {
    var sides: Int

    func path(in rect: CGRect) -> Path {
        let radius = rect.minSide / 2
        let origin = rect.localCenter

        var path = Path()
        for i in 0..<sides {
            let cyclicPoint = origin.centeredConcyclic(
                radius: radius,
                angle: 2 * .pi * CGFloat(i) / CGFloat(sides)
            )
            if i == 0 {
                path.move(to: cyclicPoint)
            } else {
                path.addLine(to: cyclicPoint)
            }
        }
        path.closeSubpath()
        return path
    }
}
