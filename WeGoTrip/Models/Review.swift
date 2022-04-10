//
//  Review.swift
//  WeGoTrip
//
//  Created by admin on 08.04.2022.
//

import Foundation

struct Review: Codable {
    var tourID: UUID
    var tourRate: Int = 3
    var guideRate: Int = 3
    var formatRate: Int = 3
    var navigationRate: Int = 3
    var firstQuestion: String = ""
    var secondQuestion: String = ""
    
    mutating func update(with rate: Int, forQuestion question: RateQuestion) {
        switch question {
        case .tourRate: tourRate = rate
        case .guideRate: guideRate = rate
        case .formatRate: formatRate = rate
        case .navigationRate: navigationRate = rate
        }
    }
    mutating func update(with text: String, forQuestion question: TextQuestion) {
        switch question {
        case .firstQuestion: firstQuestion = text
        case .secondQuestion: secondQuestion = text
        }
    }
}
