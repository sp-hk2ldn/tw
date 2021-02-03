//
//  CreditReport.swift
//  qn
//
//  Created by Stephen Parker on 31/1/2021.
//

import Foundation

struct CreditReport: Decodable {
    var score: Int
    var scoreBand: Int
    var clientRef: String
    var status: String
    var maxScoreValue: Int
    var minScoreValue: Int
    var monthsSinceLastDefaulted: Int
    var hasEverDefaulted: Bool
    var hasEverBeenDelinquent: Bool
    var percentageCreditUsed: Double
    var percentageCreditUsedDirectionFlag: Int
    var changedScore: Int
    var currentShortTermDebt: Int // Assuming that these values are rounded
    var currentShortTermNonPromotionalDebt: Int // Assuming that these values are rounded
    var currentShortTermCreditLimit: Int
    var currentShortTermCreditUtilisation: Double // Assuming percentage for this property: https://www.experian.com/blogs/ask-experian/credit-education/score-basics/credit-utilization-rate/
    var changeInShortTermDebt: Int
    var currentLongTermDebt: Int
    var currentLongTermNonPromotionalDebt: Int
    var currentLongTermCreditLimit: Int?
    var currentLongTermCreditUtilisation: Int?
    var changeInLongTermDebt: Int
    var numPositiveScoreFactors: Int
    var numNegativeScoreFactors: Int
    var equifaxScoreBand: Int
    var equifaxScoreBandDescription: ScoreBand
    var daysUntilNextReport: Int
}
