//
//  Question.swift
//  WeGoTrip
//
//  Created by admin on 08.04.2022.
//

import Foundation

protocol Question {
    var title: String { get }
}

enum RateQuestion: String, Question, CaseIterable {
   
    case tourRate
    case guideRate
    case formatRate
    case navigationRate
    
    var title: String {
        switch self {
        case .tourRate: return "Как вам тур в целом?"
        case .guideRate: return "Понравился гид?"
        case .formatRate: return "Как вам подача информации?"
        case .navigationRate: return "Удобная навигация между шагами?"
        }
    }
}

enum TextQuestion: String, Question, CaseIterable {
    
    case firstQuestion
    case secondQuestion
    
    var title: String {
        switch self {
        case .firstQuestion: return "Что вам особенно понравилось в этом туре?"
        case .secondQuestion: return "Как мы могли бы улучшить подачу информации?"
        }
    }
    
    var placeholder: String {
        switch self {
        case .firstQuestion: return "Напишите здесь, чем вам запомнился тур, посоветуете ли его друзьям и удалось ли повеселиться"
        case .secondQuestion: return "Напишите здесь, чем вам запомнился тур, посоветуете ли его друзьям и удалось ли повеселиться"
        }
    }
}
