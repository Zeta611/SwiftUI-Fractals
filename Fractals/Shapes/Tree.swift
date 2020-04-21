//
//  Tree.swift
//  Fractals
//
//  Created by Jay Lee on 2020/04/21.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

struct Tree: Fractal {
    static var name: String { "Fractal Tree" }

    var step: Int
    var angle: Double = .pi * 2 / 3

    var body: some View {
        TreeShape(step: step, angle: angle)
            .stroke(lineWidth: 0.5)
            .animation(step <= 6 ? .default : .none)
            .aspectRatio(contentMode: .fit)
    }
}

extension Tree {
    struct TreeShape: Shape {
        var step: Int
        private var _step: Double

        //    var sides: Int = 3
        var angle: CGFloat = .pi * 2 / 3

        var animatableData: Double {
            get { _step }
            set { _step = newValue }
        }

        func path(in rect: CGRect) -> Path {
            guard step > 0 else { return Path() }
            let origin = rect.localCenter.offset(y: rect.height / 6)
            /* radius is the distance between the centers of the adjacent inner
               triangle, as depicted below.
               +--------------------+
               |         /\         |
               |        /  \        |
               |       /    \       |
               |      /      \      |
               |     /________\     |
               |    /\        /\    |
               |   /  \   .  /  \   |
               |  /    \    /    \  |
               | /  .   \  /      \ |
               |/        \/        \|
               +--------------------+
             */
            let radius = rect.minSide / 4
            let turnAngles = [-angle, 0, angle]

            let initialSegments: [DirectedLineSegment] = turnAngles.map {
                // (- pi / 2), as the +y direction is downwards
                let angle = $0 - CGFloat.pi / 2
                let end = origin
                    .centeredConcyclic(radius: radius, angle: angle)
                return DirectedLineSegment(start: origin, end: end)
            }

            // Lower bound for the queue size
            //   < 3^step + 3^(step + 1) = 4 * 3^step
            // Total number of dequeue count =
            //   3 + 3^2 + ... + 3^step = 3 * (3^step - 1) / 2
            let roundedStep = _step.rounded(.up)
            let power = Int.pow(3, Int(roundedStep))

            var queue = Queue(initialSegments, capacity: 4 * power)
            var path = Path()

            for i in 0..<3 * (power - 1) / 2 {
                let isLeafNode = i >= (power - 3) / 2

                let segment = queue.dequeue()!
                path.move(to: segment.start)

                if isLeafNode {
                    path.addLine(
                        to: segment.extended(
                            multiple: CGFloat(roundedStep - _step),
                            angle: -.pi
                        )
                    )
                } else {
                    path.addLine(to: segment.end)
                }

                let nextPoints = turnAngles
                    .map { segment.extended(multiple: 0.5, angle: $0) }
                for point in nextPoints {
                    guard queue.enqueue(
                        DirectedLineSegment(start: segment.end, end: point)
                    ) else {
                        assertionFailure("Queue overflow")
                        return path
                    }
                }
            }
            return path
        }

        init(step: Int, angle: Double) {
            self.step = step
            self._step = Double(step)
            self.angle = CGFloat(angle)
        }
    }
}

struct Tree_Previews: PreviewProvider {
    static var previews: some View {
        Tree(step: 4, angle: .pi * 2 / 3)
    }
}
