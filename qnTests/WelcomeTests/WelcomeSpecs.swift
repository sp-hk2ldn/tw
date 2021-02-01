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
            welcomeVC = WelcomeViewController.instantiate(sb: "Welcome")
        }
        
        describe("The welcome screen") {
            beforeEach {
                let _ = welcomeVC.view
            }
            
            it("Has a welcome button") {
                expect(welcomeVC.welcomeButton.titleLabel?.text).to(equal("Welcome"))
            }
        }
        
        describe("The welcome button") {
            beforeEach {
                let _ = welcomeVC.view
            }
            it("Navigates to the dashboard page when tapped") {
                welcomeVC.welcomeButton.sendActions(for: .touchUpInside)
                
            }
        }
    }
}

