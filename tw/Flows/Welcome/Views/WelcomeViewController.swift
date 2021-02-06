//
//  WelcomeViewController.swift
//  tw
//
//  Created by Stephen Parker on 28/1/2021.
//

import Foundation
import UIKit
import Combine

final class WelcomeViewController: UIViewController, Storyboarded {
    @IBOutlet weak var proceedButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    @IBAction func navigateToDashboard(_ sender: UIButton) {
        view.endEditing(true)
        viewModel?.navigateToTabBar()
    }
    
    @IBAction func usernameTextFieldChanged(_ sender: UITextField) {
        viewModel?.usernameEntry = sender.text ?? ""
    }
    
    var viewModel: WelcomeViewModel?
    ///Validator Subscriptions
    private var proceedButtonEnabledSubscriber: AnyCancellable?
    private var errorMessageContentSubscriber: AnyCancellable?
    private var errorMessageVisibleSubscriber: AnyCancellable?
    
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBindings()
        usernameTextField.delegate = self
    }
    
    func configureBindings() {
        proceedButtonEnabledSubscriber = viewModel?.usernameValid
            .receive(on: RunLoop.main)
            .assign(to: \.isEnabled, on: proceedButton)
        errorMessageContentSubscriber = viewModel?.errorMessage
            .receive(on: RunLoop.main)
            .compactMap { $0 }
            .assign(to: \.text, on: errorMessageLabel)
        errorMessageVisibleSubscriber = viewModel?.usernameValid
            .dropFirst() //So we don't display the error on load
            .receive(on: RunLoop.main)
            .assign(to: \.isHidden, on: errorMessageLabel)
    }
}

extension WelcomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
