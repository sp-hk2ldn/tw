//
//  DashboardTests.swift
//  qnTests
//
//  Created by Stephen Parker on 1/2/2021.
//

import Quick
import Nimble
@testable import qn

class DashboardSpecs: QuickSpec {
    override func spec() {
        var dashboardVC: DashboardViewController!
        var userResponse: User!
        var dashboardVM: DashboardViewModel!
        let userService = MockUserService()
        beforeEach {
            dashboardVC = DashboardViewController.instantiate(storyboard: "Dashboard")
            dashboardVM = DashboardViewModel(userService: userService)
            dashboardVC.viewModel = dashboardVM
        }
        
        describe("The dashboard screen") {
            beforeEach {
                _ = dashboardVC.view
                userResponse = MockUserResponse().getUserResponse()
                dashboardVC.setupView()
            }
        }
    }
}
