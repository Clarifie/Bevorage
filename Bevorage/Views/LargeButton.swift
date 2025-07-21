//
//  LargeButton.swift
//  Bevorage
//
//  Created by Owen Hickman on 7/21/25.
//
import SwiftUI
import Foundation

struct LargeButton<AccessoryView: View>: View {
    @State private var tapped = Bool()
    let action: (() -> Void)?
    let content: AccessoryView
    
    init(action: (() -> Void)?, @ViewBuilder content: () -> AccessoryView) {
        self.action = action
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.white)
                .frame(width: 105, height: 105)
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 7, y: 7)
            self.content
        }
        .scaleEffect(tapped ? 0.95 : 1)
        .onTapGesture {
            tapped.toggle()
            if let action = self.action {
                action()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                tapped = false
            }
        }
    }
}
