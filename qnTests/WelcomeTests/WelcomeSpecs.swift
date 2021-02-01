//
//  WelcomeSpecs.swift
//  qnTests
//
//  Created by Stephen Parker on 28/1/2021.
//

import Quick
import Nimble
@testable import qn

class WelcomeSpecs: QuickSpec {
    override func spec() {
        var welcomeVC: WelcomeViewController!
        beforeEach {
            welcomeVC = WelcomeViewController.instantiate(storyboard: "Welcome")
        }
        
        describe("The welcome screen") {
            beforeEach {
                _ = welcomeVC.view
            }
            
            it("Has a welcome button") {
                expect(welcomeVC.welcomeButton.titleLabel?.text).to(equal("Welcome"))
            }
        }
    }
}
