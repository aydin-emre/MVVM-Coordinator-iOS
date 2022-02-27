//
//  HomeViewController.swift
//  MVVM Coordinator Example
//
//  Created by Emre on 27.02.2022.
//

import UIKit

// MARK: - HomeViewControllerDelegate
protocol HomeViewControllerDelegate: AnyObject {
    func didPressLoginVC(_ viewController: HomeViewController)
}

// MARK: - HomeViewController
class HomeViewController: UIViewController {

    // MARK: - Instance Properties
    weak var delegate: HomeViewControllerDelegate?

    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func profileButton(_ sender: UIButton) {
        delegate?.didPressLoginVC(self)
    }

}

// MARK: - StoryboardInstantiable
extension HomeViewController: StoryboardInstantiable {

    class func instantiate(delegate: HomeViewControllerDelegate) -> HomeViewController {
        let viewController = instanceFromStoryboard()
        viewController.delegate = delegate
        return viewController
    }

}
