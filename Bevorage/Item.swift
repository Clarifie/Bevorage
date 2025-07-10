//
//  Item.swift
//  Bevorage
//
//  Created by Owen Hickman on 7/10/25.
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
