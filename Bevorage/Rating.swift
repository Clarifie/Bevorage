//
//  Rating.swift
//  Bevorage
//
//  Created by Owen Hickman on 7/14/25.
//
import Foundation
import SwiftData

@Model
final class Rating {
    @Attribute(.unique) var ratingID: UUID
    var beverage: Beverage
    var rating: Int
    var review: String?
    var timestamp: Date?
    
    init(beverage: Beverage) {
        self.beverage = beverage;
        self.ratingID = UUID()
        self.rating = 0
        self.review = Optional<String>.none
        self.timestamp = Date()
    }
}
