//
//  HomeView.swift
//  ShowcaseUI
//
//  Created by Leandro Bastos on 23/09/26.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    
    private var filtered: [ExampleModel] {
        guard !searchText.isEmpty else { return ExampleCatalog.all }
        
        return ExampleCatalog.all.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.subtitle.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    private var groupedByCategory: [(Category, [ExampleModel])] {
        Category.allCases.compactMap { category in
            let items = filtered.filter { $0.category == category }
            return items.isEmpty ? nil : (category, items)
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(groupedByCategory, id: \.0) { category, items in
                    Section {
                        ForEach(items) { example in
                            NavigationLink {
                                example.destination.navigationTitle(example.title)
                            } label: {
                                ExampleRow(exampleModel: example)
                            }
                        }
                    } header: {
                        Label(category.rawValue, systemImage: category.icon)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Showcase")
            .searchable(text: $searchText, prompt: "Search")
            .overlay {
                if filtered.isEmpty {
                    ContentUnavailableView.search(text: searchText)
                }
            }
        }
    }
}

private struct ExampleRow: View {
    let exampleModel: ExampleModel
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: exampleModel.icon)
                .font(.title2)
                .foregroundStyle(.tint)
                .frame(width: 32)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(exampleModel.title)
                    .font(.body.weight(.medium))
                Text(exampleModel.subtitle)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    HomeView()
}
