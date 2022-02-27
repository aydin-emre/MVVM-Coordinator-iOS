//
//  HomeCoordinator.swift
//  MVVM Coordinator Example
//
//  Created by Emre on 27.02.2022.
//

import UIKit

class HomeCoordinator: Coordinator {

    var children: [Coordinator] = []
    let router: Router

    init(router: Router) {
        self.router = router
    }

    func present(animated: Bool, onDismissed: (() -> Void)?) {
        let viewController = HomeViewController.instantiate(delegate: self)
        router.present(viewController, animated: animated, onDismissed: onDismissed)
    }

}

extension HomeCoordinator: HomeViewControllerDelegate {

    func didPressLoginVC(_ viewController: HomeViewController) {
        let router = NavigationRouter(parentViewController: viewController)
        let coordinator = LoginCoordinator(router: router)
        presentChild(coordinator, animated: true)
    }

}
