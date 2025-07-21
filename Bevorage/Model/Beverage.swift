//
//  Beverage.swift
//  Bevorage
//
//  Created by Owen Hickman on 7/14/25.
//

import Foundation
import SwiftData

@Model
final class Beverage {
    public var name: String
    public var price: Double?
    public var year: Int?
    @Relationship(deleteRule: .cascade, inverse: \Rating.beverage)
    public var latestRating: [Rating]
    
    init(name: String = "",
         price: Optional<Double> = .none,
         year: Optional<Int> = .none,
         latestRating: [Rating] = []) {
        self.name = name
        self.price = price
        self.latestRating = latestRating
    }
    
    func addRating(rating: Rating) {
        self.latestRating.append(rating)
    }
    
    func removeRating(at: Int) {
        if 0 <= at && at < self.latestRating.count {
            self.latestRating.remove(at: at)
        }
    }
}
