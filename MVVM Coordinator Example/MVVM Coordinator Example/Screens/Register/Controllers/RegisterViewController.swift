//
//  RegisterViewController.swift
//  MVVM Coordinator Example
//
//  Created by Emre on 27.02.2022.
//

import UIKit

// MARK: - RegisterViewControllerDelegate
protocol RegisterViewControllerDelegate: AnyObject {
    func didPressDismiss(_ viewController: RegisterViewController)
}

// MARK: - RegisterViewController
class RegisterViewController: UIViewController {

    // MARK: - Instance Properties
    weak var delegate: RegisterViewControllerDelegate?

    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func dismissButton(_ sender: UIButton) {
        delegate?.didPressDismiss(self)
    }

}

// MARK: - StoryboardInstantiable
extension RegisterViewController: StoryboardInstantiable {

    class func instantiate(delegate: RegisterViewControllerDelegate) -> RegisterViewController {
        let viewController = instanceFromStoryboard()
        viewController.delegate = delegate
        return viewController
    }

}
