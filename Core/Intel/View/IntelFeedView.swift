//
//  IntelFeedView.swift
//  Construction Intel
//
//  Created by AI on 9/19/25.
//

import SwiftUI

struct IntelFeedView: View {
    @StateObject private var viewModel = CompaniesViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                Section("Dashboard") {
                    DashboardStatsView(items: viewModel.feedItems)
                }
                Section("Intel Feed") {
                    ForEach(viewModel.feedItems) { item in
                        IntelRowView(item: item)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Intel")
        }
    }
}

struct DashboardStatsView: View {
    let items: [IntelItem]
    
    var body: some View {
        let total = items.count
        let aiCount = items.filter { $0.sourceType == .ai }.count
        let gov = items.filter { $0.sourceType == .gov }.count
        let news = items.filter { $0.sourceType == .news }.count
        let rss = items.filter { $0.sourceType == .rss }.count
        
        HStack(spacing: 12) {
            StatPill(title: "Total", value: total)
            StatPill(title: "AI", value: aiCount)
            StatPill(title: "Gov", value: gov)
            StatPill(title: "News", value: news)
            StatPill(title: "RSS", value: rss)
        }
    }
}

struct StatPill: View {
    let title: String
    let value: Int
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.headline)
            Text(title)
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .padding(8)
        .frame(minWidth: 58)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    IntelFeedView()
}

