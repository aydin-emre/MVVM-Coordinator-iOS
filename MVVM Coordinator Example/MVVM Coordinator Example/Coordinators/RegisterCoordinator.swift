//
//  RegisterCoordinator.swift
//  MVVM Coordinator Example
//
//  Created by Emre on 27.02.2022.
//

import UIKit

class RegisterCoordinator: Coordinator {

    var children: [Coordinator] = []
    let router: Router

    init(router: Router) {
        self.router = router
    }

    func present(animated: Bool, onDismissed: (() -> Void)?) {
        let viewController = RegisterViewController.instantiate(delegate: self)
        router.present(viewController, animated: animated, onDismissed: onDismissed)
    }

}

extension RegisterCoordinator: RegisterViewControllerDelegate {

    func didPressDismiss(_ viewController: RegisterViewController) {
        router.dismiss(animated: true)
    }

}
