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
    let animationMaxStep: Int
    let maxAngle: Double

    @EnvironmentObject private var timerWrapper: TimerWrapper

    @State private var step = 2
    @State private var angle = 0.0

    @State private var isAnimating = false
    @State private var isEditing = false

    @State private var increaseAnimation = true

    private var animationDuration: TimeInterval { timerWrapper.timerInterval }
    private let angleIncrement = 0.01

    var body: some View {
        VStack {
            F(step: step, angle: angle)
                .animation(.default)
                .drawingGroup()

            HStack(spacing: 40) {
                Stepper("Step \(step)", value: $step, in: 0...maxStep)
                    .fixedSize()

                Toggle(isOn: $isAnimating) {
                    Text("Animation")
                }
                .disabled(step > animationMaxStep)
                .fixedSize()
            }

            Slider(
                value: $angle,
                in: 0...maxAngle,
                onEditingChanged: { self.isEditing = $0 }
            )
            .animation(.linear(duration: animationDuration))
            .padding([.horizontal, .bottom])
        }
        .navigationBarTitle("\(F.name)")
        .onReceive(timerWrapper.$date) { _ in
            guard !self.isEditing
                && self.isAnimating
                && self.step <= self.animationMaxStep
                else { return }
            DispatchQueue.main.async {
                if self.increaseAnimation {
                    if self.angle + self.angleIncrement > self.maxAngle {
                        self.angle = self.maxAngle
                        self.increaseAnimation = false
                    } else {
                        self.angle += self.angleIncrement
                    }
                } else {
                    if self.angle - self.angleIncrement < 0 {
                        self.angle = 0
                        self.increaseAnimation = true
                    } else {
                        self.angle -= self.angleIncrement
                    }
                }
            }
        }
    }

    init(maxStep: Int, maxAngle: Double = 2 * .pi) {
        self.maxStep = maxStep
        self.animationMaxStep = maxStep
        self.maxAngle = maxAngle
    }

    init(maxStep: Int, animationMaxStep: Int, maxAngle: Double = 2 * .pi) {
        self.maxStep = maxStep
        self.animationMaxStep = animationMaxStep
        self.maxAngle = maxAngle
    }
}

struct Demonstration_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Demonstration<Triangle>(
                maxStep: 8,
                animationMaxStep: 6
            )

            Demonstration<Carpet>(
                maxStep: 4,
                animationMaxStep: 3
            )

            Demonstration<Tree>(
                maxStep: 10,
                animationMaxStep: 8,
                maxAngle: .pi * 2 / 3
            )
        }
        .environmentObject(TimerWrapper())
    }
}
