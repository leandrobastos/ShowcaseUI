//
//  Category.swift
//  ShowcaseUI
//
//  Created by Leandro Bastos on 23/09/26.
//

enum Category: String, CaseIterable {
    case layout = "Layout"
    case animation = "Animation"
    
    var icon: String {
        switch self {
        case .layout: return "rectangle.split.3x1"
        case .animation: return "sparkles"
        }
    }
}
