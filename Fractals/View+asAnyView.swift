//
//  View+asAnyView.swift
//  Fractals
//
//  Created by Jay Lee on 2020/04/21.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import SwiftUI

extension View {
    func asAnyView() -> AnyView {
        AnyView(self)
    }
}
