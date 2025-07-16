//
//  BeverageDetail.swift
//  Bevorage
//
//  Created by Owen Hickman on 7/14/25.
//

import SwiftUI

struct BeverageDetail: View {
    var beverage: Beverage
    
    var body: some View {
        HStack {
            Text(beverage.name).font(.headline)
            if let price = beverage.price {
                Spacer()
                Text("$\(price.description)").font(.caption)
            }
        }
    }
}

#Preview {
    BeverageDetail(beverage: Beverage(name: "Test", price: 1.0))
}
