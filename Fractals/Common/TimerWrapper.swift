//
//  TimerWrapper.swift
//  Fractals
//
//  Created by Jay Lee on 2020/04/22.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import Combine
import Foundation

final class TimerWrapper: ObservableObject {
    @Published var date = Date()

    let timerInterval: TimeInterval

    private var cancellable: Cancellable?

    init(timerInterval: TimeInterval = 0.015) {
        self.timerInterval = timerInterval
        self.cancellable = Timer
            .publish(every: timerInterval, on: .main, in: .common)
            .autoconnect()
            .sink { self.date = $0 }
    }

    deinit {
        cancellable?.cancel()
    }
}
