//
//  ContentView.swift
//  Bevorage
//
//  Created by Owen Hickman on 7/10/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Beverage]
    @State private var searchText: String = ""

    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        BeverageDetail(beverage: item)
                    } label: {
                        BeverageView(beverage: item)
                    }
                }
                .deleteDisabled(true)
            }
            .listStyle(.grouped)
            .searchable(text: $searchText, prompt: "Hmm")
            .overlay(alignment: .bottom, content: {
                HStack {
                    LargeButton(action: addItem, content: {
                        Image(systemName: "swift")
                            .foregroundColor(.black)
                            .font(.system(size: 50, weight: .semibold))
                    })
                }
            })
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Beverage(name:"Test", price:14.55)
            modelContext.insert(newItem)
        }
    }

    // Not allowing deleting for now
    /* private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }*/
}

#Preview {
    ContentView()
        .modelContainer(for: Beverage.self, inMemory: true)
}
