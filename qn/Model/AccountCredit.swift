//
//  Account.swift
//  qn
//
//  Created by Stephen Parker on 31/1/2021.
//

import Foundation


struct Account: Decodable {    
    var accountIDVStatus: IDVStatus
    var creditReportInfo: CreditReport
    var dashboardStatus: DashboardStatus
    var personaType: Persona
    var coachingSummary: CoachingSummary
    var augmentedCreditScore: AugmentedCreditScore?
}
