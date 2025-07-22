//
//  UserProfile.swift
//  left_days
//
//  Created by 中川　匠 on 2025/07/23.
//

import Foundation
import SwiftData

@Model
class UserProfile {
    var id: UUID
    var birthDate: Date?
    var createdAt: Date
    
    init(id: UUID, birthDate: Date? = nil, createdAt: Date) {
        self.id = id
        self.birthDate = birthDate
        self.createdAt = createdAt
    }
}
