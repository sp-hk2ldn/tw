//
//  CoachingSummary.swift
//  qn
//
//  Created by Stephen Parker on 31/1/2021.
//

import Foundation

struct CoachingSummary: Decodable {
    var activeTodo: Bool
    var activeChat: Bool
    var numberOfTodoItems: Int
    var numberOfCompletedTodoItems: Int
    var selected: Bool
}
