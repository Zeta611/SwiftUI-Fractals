//
//  Carpet.swift
//  Fractals
//
//  Created by Jay Lee on 2020/04/21.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

struct Carpet: View {
    let step: Int
    let degrees: Double

    private var child: some View { Carpet(step: step - 1, degrees: degrees) }

    private var defaultRow: some View {
        HStack(spacing: 0) { child; child; child }
    }

    private var middleRow: some View {
        HStack(spacing: 0) { child; child.hidden(); child }
    }

    var body: some View {
        if step > 0 {
            return VStack(spacing: 0) {
                defaultRow
                middleRow
                defaultRow
            }
            .asAnyView()
        } else {
            return Polygon(sides: 4)
                .rotationEffect(.degrees(45 + degrees))
                .aspectRatio(1, contentMode: .fit)
                .asAnyView()
        }
    }
}

struct Carpet_Previews: PreviewProvider {
    static var previews: some View {
        Carpet(step: 2, degrees: 0)
    }
}
