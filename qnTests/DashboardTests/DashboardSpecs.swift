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
        var accountResponse: Account!
        var dashboardVM: DashboardViewModel!
        let accountService = MockAccountService()
        beforeEach {
            dashboardVC = DashboardViewController.instantiate(storyboard: "Dashboard")
            dashboardVM = DashboardViewModel(accountService: accountService)
            dashboardVC.viewModel = dashboardVM
        }
        
        describe("The dashboard screen") {
            beforeEach {
                _ = dashboardVC.view
                accountResponse = MockAccountResponse().getAccountResponse()
                dashboardVC.setupView()
                dashboardVC.setupChart(creditScore: accountResponse.creditReportInfo.score,
                                       maxCreditScore: accountResponse.creditReportInfo.maxScoreValue)
            }
            
            it("Shows a users credit score") {
                let labels = dashboardVC.chartView.subviews.compactMap { $0 as? UILabel }
                expect(labels.contains(where: { $0.text == String(accountResponse.creditReportInfo.score) })).to(equal(true))
            }
            it("Shows a maximum credit score") {
                let labels = dashboardVC.chartView.subviews.compactMap { $0 as? UILabel }
                expect(labels.contains(where: { $0.text == "out of \(accountResponse.creditReportInfo.maxScoreValue)" })).to(equal(true))
            }
        }
    }
}
