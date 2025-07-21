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
    @State var beverage: Beverage
    
    var body: some View {
        NavigationStack {
            Form {
                LabeledContent {
                    TextField("Name", text: $beverage.name)
                } label: {
                    Text("Name")
                }
                LabeledContent {
                    TextField("0.0", value: $beverage.price, formatter: PriceFormatter.formatter)
                        .keyboardType(.decimalPad)
                } label: {
                    Text("Price")
                }
                
            }
            .navigationTitle( $beverage.name.wrappedValue)
        }
    }
}

#Preview {
    BeverageDetail(beverage: Beverage(name: "Onevinoen ", price: 1.0))
}
