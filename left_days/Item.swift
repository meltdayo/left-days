//
//  Item.swift
//  left_days
//
//  Created by 中川　匠 on 2025/07/22.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
