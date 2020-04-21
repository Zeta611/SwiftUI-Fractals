//
//  Carpet.swift
//  Fractals
//
//  Created by Jay Lee on 2020/04/21.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

struct Carpet: Fractal {
    let step: Int
    let angle: Double

    static var name: String { "Sierpiński Carpet" }

    private var child: some View { Carpet(step: step - 1, angle: angle) }

    private var defaultRow: some View {
        HStack(spacing: 0) { child; child; child }
    }

    private func middleRow(width: CGFloat) -> some View {
        HStack(spacing: 0) { child; Spacer(minLength: width); child }
    }

    var body: some View {
        if step > 0 {
            return GeometryReader { geometry in
                VStack(spacing: 0) {
                    self.defaultRow
                        .frame(width: geometry.size.width)
                    self.middleRow(width: geometry.size.width / 3)
                        .frame(width: geometry.size.width)
                    self.defaultRow
                        .frame(width: geometry.size.width)
                }
            }
            .aspectRatio(contentMode: .fit)
            .asAnyView()
        } else {
            return RegularPolygon(sides: 4)
                .rotationEffect(.radians(.pi / 4 + angle))
                .aspectRatio(1, contentMode: .fit)
                .asAnyView()
        }
    }
}

struct Carpet_Previews: PreviewProvider {
    static var previews: some View {
        Carpet(step: 2, angle: 0)
    }
}
