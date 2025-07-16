//
//  BeverageDetail.swift
//  Bevorage
//
//  Created by Owen Hickman on 7/14/25.
//

import SwiftUI

struct BeverageView: View {
    var beverage: Beverage
    
    var body: some View {
        HStack {
            Image("DefaultImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
            VStack {
                Text(beverage.name).font(.headline)
                if let price = beverage.price {
                    Text("$\(price.description)").font(.caption)
                }
            }
        }
    }
}

struct BeverageDetail: View {
    var beverage: Beverage
    
    var body: some View {
        Text("temp")
    }
}

#Preview {
    BeverageView(beverage: Beverage(name: "Onevinoen blanc deu pafwefwe wfe fewp", price: 1.0))
}
