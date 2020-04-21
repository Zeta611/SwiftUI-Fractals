//
//  DirectedLineSegment.swift
//  Fractals
//
//  Created by Jay Lee on 2020/04/21.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import CoreGraphics

struct DirectedLineSegment {
    var start: CGPoint
    var end: CGPoint

    var dx: CGFloat { end.x - start.x }
    var dy: CGFloat { end.y - start.y }

    var magnitude: CGFloat { sqrt(dx * dx + dy * dy) }
    var direction: CGFloat { atan2(dy, dx) }

    /// Returns a point extended in the direction rotated counter-clockwise by `angle` with a
    /// distance `multiple` times the magnitude of this line segment.
    func extended(multiple: CGFloat, angle: CGFloat) -> CGPoint {
        end.centeredConcyclic(
            radius: multiple * magnitude,
            angle: direction + angle
        )
    }
}
