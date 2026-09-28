//
//  ExampleModel.swift
//  ShowcaseUI
//
//  Created by Leandro Bastos on 23/09/26.
//

import Foundation
import SwiftUI

struct ExampleModel: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let category: Category
    let icon: String
    let destination: AnyView
    
    init<V: View>(title: String,
                  subtitle: String,
                  category: Category,
                  icon: String,
                  @ViewBuilder destination: () -> V) {
        self.title = title
        self.subtitle = subtitle
        self.category = category
        self.icon = icon
        self.destination = AnyView(destination())
    }
}
