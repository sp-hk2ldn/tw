//
//  MockAccountResponse.swift
//  qnTests
//
//  Created by Stephen Parker on 1/2/2021.
//

@testable import qn
import Foundation

class MockAccountResponse {
    func getAccountResponse() -> Account {
        let idvStatus: IDVStatus = .pass
        
        let scoreBand: ScoreBand = .poor
        
        let dashboardStatus: DashboardStatus = .pass
        
        let personaType: Persona = .experienced
        
        let coachingSummary = CoachingSummary(
            activeTodo: true,
            activeChat: true,
            numberOfTodoItems: 3,
            numberOfCompletedTodoItems: 1,
            selected: true)
        
        let augmentedScore: AugmentedCreditScore = .something
        
        let creditReportInfo = CreditReport(
            score: 55,
            scoreBand: 210,
            clientRef: "TH-ISI-5EMAED555-UP2222",
            status: "MATCH",
            maxScoreValue: 700,
            minScoreValue: 0,
            monthsSinceLastDefaulted: 15,
            hasEverDefaulted: true,
            hasEverBeenDelinquent: false,
            percentageCreditUsed: 80,
            percentageCreditUsedDirectionFlag: 1,
            changedScore: 0,
            currentShortTermDebt: 13333,
            currentShortTermNonPromotionalDebt: 20333,
            currentShortTermCreditLimit: 123000,
            currentShortTermCreditUtilisation: 80,
            changeInShortTermDebt: 100,
            currentLongTermDebt: 40203,
            currentLongTermNonPromotionalDebt: 39000,
            currentLongTermCreditLimit: 56000,
            currentLongTermCreditUtilisation: 80,
            changeInLongTermDebt: -135,
            numPositiveScoreFactors: 5,
            numNegativeScoreFactors: 1,
            equifaxScoreBand: 2,
            equifaxScoreBandDescription: scoreBand,
            daysUntilNextReport: 20)
        
        let account = Account(
            accountIDVStatus: idvStatus,
            creditReportInfo: creditReportInfo,
            dashboardStatus: dashboardStatus,
            personaType: personaType,
            coachingSummary: coachingSummary,
            augmentedCreditScore: augmentedScore
        )
        
        return account
    }
}
