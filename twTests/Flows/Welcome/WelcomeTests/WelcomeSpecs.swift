//
//  WelcomeSpecs.swift
//  twTests
//
//  Created by Stephen Parker on 28/1/2021.
//

import Quick
import Nimble
import Combine

@testable import tw

class WelcomeSpecs: QuickSpec {
    override func spec() {
        var welcomeVC: WelcomeViewController!
        var welcomeVM: WelcomeViewModel!

        beforeEach {
            welcomeVC = WelcomeViewController.instantiate(storyboard: "Welcome")
            welcomeVM = WelcomeViewModel(
                coordinator: WelcomeCoordinator(navigationController: UINavigationController()),
                userService: UserService(realmClient: MockRealmClient()))
            welcomeVC.viewModel = welcomeVM
        }
    
        describe("The welcome screen") {
            beforeEach {
                _ = welcomeVC.view
            }
            
            it("Has a proceed button") {
                expect(welcomeVC.proceedButton.titleLabel?.text).to(equal("Proceed"))
            }
            it("Should not be enabled if the text field is empty") {
                expect(welcomeVC.proceedButton.isEnabled).to(equal(false))
            }
            it("Changes to enabled if the textfield entry is valid and filled") {
                welcomeVC.viewModel!.usernameEntry = "valid-entry"
                expect(welcomeVC.proceedButton.isEnabled).toEventually(equal(true))
            }
            it("Displays an error message if the textfield entry is invalid") {
                welcomeVC.viewModel!.usernameEntry = "an-invalid-entry"
                expect(welcomeVC.errorMessageLabel.text).toEventually(equal(Constants.shared.messageInvalidUser))
            }
        }
    }
}
