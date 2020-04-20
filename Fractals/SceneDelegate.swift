//
//  SceneDelegate.swift
//  Fractals
//
//  Created by Jay Lee on 2020/04/21.
//  Copyright © 2020 Jay Lee. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private var orientation = Orientation()

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        let contentView = ContentView()
            .environmentObject(orientation)

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(
                rootView: contentView
            )
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func windowScene(
        _ windowScene: UIWindowScene,
        didUpdate previousCoordinateSpace: UICoordinateSpace,
        interfaceOrientation previousInterfaceOrientation: UIInterfaceOrientation,
        traitCollection previousTraitCollection: UITraitCollection
    ) {
        orientation.isLandScape = windowScene.interfaceOrientation.isLandscape
    }
}

