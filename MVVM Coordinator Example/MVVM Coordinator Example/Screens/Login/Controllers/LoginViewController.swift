//
//  LoginViewController.swift
//  MVVM Coordinator Example
//
//  Created by Emre on 27.02.2022.
//

import UIKit

// MARK: - LoginViewControllerDelegate
protocol LoginViewControllerDelegate: AnyObject {
    func didPressRegisterVC(_ viewController: LoginViewController)
    func didPressLoginVC(_ viewController: LoginViewController)
    func didPressDismiss(_ viewController: LoginViewController)
}

// MARK: - LoginViewController
class LoginViewController: UIViewController {

    // MARK: - Instance Properties
    weak var delegate: LoginViewControllerDelegate?

    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButton(_ sender: UIButton) {
        delegate?.didPressLoginVC(self)
    }

    @IBAction func registerButton(_ sender: UIButton) {
        delegate?.didPressRegisterVC(self)
    }

    @IBAction func dismissButton(_ sender: UIButton) {
        delegate?.didPressDismiss(self)
    }

}

// MARK: - StoryboardInstantiable
extension LoginViewController: StoryboardInstantiable {

    class func instantiate(delegate: LoginViewControllerDelegate) -> LoginViewController {
        let viewController = instanceFromStoryboard()
        viewController.delegate = delegate
        return viewController
    }

}
