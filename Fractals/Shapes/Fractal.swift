//
//  Fractal.swift
//  Fractals
//
//  Created by Jay Lee on 2020/04/21.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

protocol Fractal: View {
    static var name: String { get }
    init(step: Int, degrees: Double)
}
