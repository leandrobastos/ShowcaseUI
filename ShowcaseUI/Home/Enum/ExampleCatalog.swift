//
//  ExampleCatalog.swift
//  ShowcaseUI
//
//  Created by Leandro Bastos on 23/09/26.
//

import SwiftUI

enum ExampleCatalog {
    static let all: [ExampleModel] = [
        ExampleModel(
            title: "Side Panel",
            subtitle: "Painel lateral",
            category: .layout,
            icon: "sidebar.left"
        ) {
            SidePanelView()
        },
        ExampleModel(
            title: "Search Tab",
            subtitle: "Barra de pesquisa",
            category: .layout,
            icon: "rectangle.stack.badge.plus"
        ) {
            SearchTabView()
        }
    ]
}
