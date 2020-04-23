//
//  Triangle.swift
//  Fractals
//
//  Created by Jay Lee on 2020/04/21.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

struct Triangle: Fractal {
    let step: Int
    let angle: Double

    static var name: String { "Sierpiński Triangle" }

    private var child: some View { Triangle(step: step - 1, angle: angle) }

    private var bottomRow: some View {
        HStack(spacing: 0) { child; child }
    }

    var body: some View {
        if step > 0 {
            return GeometryReader { geometry in
                VStack(spacing: 0) {
                    self.child
                        .frame(width: geometry.size.width / 2)
                    self.bottomRow
                        .frame(width: geometry.size.width)
                }
            }
            .aspectRatio(contentMode: .fit)
            .asAnyView()
        } else {
            return RegularPolygon(sides: 3)
                .rotationEffect(.radians(.pi / 6 + angle))
                .aspectRatio(contentMode: .fit)
                .asAnyView()
        }
    }
}

struct Triangle_Previews: PreviewProvider {
    static var previews: some View {
        Triangle(step: 2, angle: 0)
    }
}
