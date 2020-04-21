//
//  Triangle.swift
//  Fractals
//
//  Created by Jay Lee on 2020/04/21.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

struct Triangle: View {
    let step: Int
    let degrees: Double

    private var child: some View { Triangle(step: step - 1, degrees: degrees) }

    private var topRow: some View {
        HStack(spacing: 0) { child }
    }

    private var bottomRow: some View {
        HStack(spacing: 0) { child; child }
    }

    var body: some View {
        if step > 0 {
            return GeometryReader { geometry in
                VStack(spacing: 0) {
                    self.topRow
                        .frame(width: geometry.size.width / 2)
                    self.bottomRow
                        .frame(width: geometry.size.width)
                }
            }
            .aspectRatio(contentMode: .fit)
            .asAnyView()
        } else {
            return Polygon(sides: 3)
                .rotationEffect(.degrees(30 + degrees))
                .aspectRatio(1, contentMode: .fit)
                .asAnyView()
        }
    }
}

struct Triangle_Previews: PreviewProvider {
    static var previews: some View {
        Triangle(step: 2, degrees: 0)
    }
}
