//
//  Int+pow.swift
//  Fractals
//
//  Created by Jay Lee on 2020/04/21.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import Foundation

extension Int {
    static func pow(_ base: Int, _ exponent: Int) -> Int {
        var base = base
        var exponent = exponent
        var result = 1
        while true {
            if !exponent.isMultiple(of: 2) {
                result *= base
            }
            exponent /= 2
            if exponent == 0 { break }
            base *= base
        }
        return result
    }
}
