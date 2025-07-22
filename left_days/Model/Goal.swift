//
//  Goal.swift
//  left_days
//
//  Created by 中川　匠 on 2025/07/23.
//

import Foundation
import SwiftData

@Model
class Goal {
    var id: UUID
    var title: String
    var targetDate: Date?
    var targetAge: Int?
    var isAgeGoal: Bool
    var priority: Int
    var createdAt: Date
    
    init(id: UUID, title: String, targetDate: Date? = nil, targetAge: Int? = nil, isAgeGoal: Bool, priority: Int, createdAt: Date) {
        self.id = id
        self.title = title
        self.targetDate = targetDate
        self.targetAge = targetAge
        self.isAgeGoal = isAgeGoal
        self.priority = priority
        self.createdAt = createdAt
    }
}
