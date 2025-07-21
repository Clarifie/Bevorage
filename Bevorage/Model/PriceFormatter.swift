//
//  PriceFormatter.swift
//  Bevorage
//
//  Created by Owen Hickman on 7/19/25.
//
import Foundation

// Add thread safety
class PriceFormatter: NumberFormatter, @unchecked Sendable {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init() {
        super.init()
        self.locale = Locale.current
        //self.maximumFractionDigits = 2
        //self.alwaysShowsDecimalSeparator = true
        self.numberStyle = .currency
    }
    
    static let formatter = PriceFormatter()
}
