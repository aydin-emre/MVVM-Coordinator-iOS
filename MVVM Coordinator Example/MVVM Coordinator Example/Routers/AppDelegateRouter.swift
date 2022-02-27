//
//  AppDelegateRouter.swift
//  MVVM Coordinator Example
//
//  Created by Emre on 27.02.2022.
//

import UIKit

public class AppDelegateRouter: Router {

    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func present(_ viewController: UIViewController, animated: Bool, onDismissed: (() -> Void)?) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }

    func dismiss(animated: Bool) {}

}
