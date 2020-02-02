//
//  AppModule.swift
//  CleanseGithubBrowser
//
//  Created by Mike Lewis on 6/10/16.
//  Copyright © 2016 Square, Inc. All rights reserved.
//

import UIKit
import Cleanse
import SwiftUI

struct RootWindowModule : Cleanse.Module {
    static func configure(binder: UnscopedBinder) {
        binder
            .bind()
            .to { (rootViewController: TaggedProvider<UIViewController.Root>, scene: UIScene) -> UIWindow in
            guard let windowScene = scene as? UIWindowScene else {
                fatalError()
            }

            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = rootViewController.get()
            return window
        }

        // This satisfies UIWindow wanting the TaggedProvider<UIViewController.Root>
        binder
            .bind()
            .tagged(with: UIViewController.Root.self)
            .to { () -> UIViewController in

            // Create the SwiftUI view that provides the window contents.
            let contentView = ContentView()
            return UIHostingController(rootView: contentView)
        }
    }
}

extension UIViewController {
    /// This will represent the rootViewController that is assigned to our main window
    public struct Root : Tag {
        public typealias Element = UIViewController
    }
}
