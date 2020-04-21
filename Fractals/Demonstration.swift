//
//  Demonstration.swift
//  Fractals
//
//  Created by Jay Lee on 2020/04/21.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

struct Demonstration<F>: View where F: Fractal {
    let maxStep: Int
    @State private var step = 2
    @State private var degrees = 0.0

    var body: some View {
        VStack {
            F(step: step, degrees: degrees)
                .drawingGroup()

            Stepper("Step \(step)", value: $step, in: 0...maxStep)
                .fixedSize()

            Slider(value: $degrees, in: 0.0...360.0)
                .padding(.horizontal)
        }
        .navigationBarTitle("\(F.name)")
    }
}

struct Demonstration_Previews: PreviewProvider {
    static var previews: some View {
        Demonstration<Triangle>(maxStep: 8)
    }
}
