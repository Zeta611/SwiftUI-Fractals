//
//  ContentView.swift
//  Fractals
//
//  Created by Jay Lee on 2020/04/21.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var orientation: Orientation
    @State private var step = 2
    @State private var degrees = 0.0

    var body: some View {
        VStack {
            if orientation.isLandScape {
                HStack {
                    Carpet(step: step, degrees: degrees)
                        .drawingGroup()

//                    Triangle(step: step, degrees: degrees)
//                        .drawingGroup()
                }
            } else {
                VStack {
                    Carpet(step: step, degrees: degrees)
                        .drawingGroup()

//                    Triangle(step: step, degrees: degrees)
//                        .drawingGroup()
                }
            }

            Stepper("Step \(step)", value: $step, in: 0...8)
                .fixedSize()

            Slider(value: $degrees, in: 0.0...360.0)
                .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
