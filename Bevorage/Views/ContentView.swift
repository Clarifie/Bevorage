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
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
            }
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
