//
//  ContentView.swift
//  Fractals
//
//  Created by Jay Lee on 2020/04/21.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: Demonstration<Triangle>(
                        maxStep: 8,
                        animationMaxStep: 6
                    )
                ) {
                    Spacer()
                    Triangle(step: 2, angle: 0)
                    Spacer()
                }

                NavigationLink(
                    destination: Demonstration<Carpet>(
                        maxStep: 4,
                        animationMaxStep: 3
                    )
                ) {
                    Spacer()
                    Carpet(step: 2, angle: 0)
                    Spacer()
                }

                NavigationLink(
                    destination: Demonstration<Tree>(
                        maxStep: 10,
                        animationMaxStep: 6,
                        maxAngle: .pi * 2 / 3
                    )
                ) {
                    Spacer()
                    Tree(step: 4, angle: .pi * 2 / 3)
                    Spacer()
                }
            }
            .navigationBarTitle("Fractal Shapes")

            // Initial detail view for iPadOS & macOS
            Demonstration<Triangle>(maxStep: 8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
