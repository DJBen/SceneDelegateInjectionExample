//
//  AppComponent.swift
//  CleanseGithubBrowser
//
//  Created by holmes on 9/21/16.
//  Copyright © 2016 Square, Inc. All rights reserved.
//

import Cleanse
import UIKit

struct AppComponent: Cleanse.RootComponent {
    typealias Root = PropertyInjector<SceneDelegate>
    typealias Scope = Singleton
    typealias Seed = UIScene

    static func configure(binder: Binder<Singleton>) {
        binder.include(module: CoreAppModule.self)
        binder.include(module: RootWindowModule.self)
    }

    static func configureRoot(binder bind: ReceiptBinder<PropertyInjector<SceneDelegate>>) -> BindingReceipt<PropertyInjector<SceneDelegate>> {
        bind.propertyInjector { (bind) -> BindingReceipt<PropertyInjector<SceneDelegate>> in
            bind.to(injector: SceneDelegate.injectProperties)
        }
    }
}


struct CoreAppModule : Cleanse.Module {
    static func configure(binder: Binder<Singleton>) {
        // Bind common dependencies.
        binder.include(module: FoundationCommonModule.self)
    }
}
