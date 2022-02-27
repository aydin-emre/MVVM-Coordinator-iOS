//
//  LoginCoordinator.swift
//  MVVM Coordinator Example
//
//  Created by Emre on 27.02.2022.
//

import UIKit

class LoginCoordinator: Coordinator {

    var children: [Coordinator] = []
    let router: Router

    init(router: Router) {
        self.router = router
    }

    func present(animated: Bool, onDismissed: (() -> Void)?) {
        let viewController = LoginViewController.instantiate(delegate: self)
        router.present(viewController, animated: animated, onDismissed: onDismissed)
    }

}

extension LoginCoordinator: LoginViewControllerDelegate {

    func didPressLoginVC(_ viewController: LoginViewController) {
        let coordinator = LoginCoordinator(router: router)
        presentChild(coordinator, animated: true)
    }

    func didPressRegisterVC(_ viewController: LoginViewController) {
        let router = NavigationRouter(parentViewController: viewController)
        let coordinator = RegisterCoordinator(router: router)
        presentChild(coordinator, animated: true)
    }

    func didPressDismiss(_ viewController: LoginViewController) {
        router.dismiss(animated: true)
    }

}
