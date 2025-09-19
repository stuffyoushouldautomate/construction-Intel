//
//  CompanyDetailView.swift
//  Construction Intel
//
//  Created by AI on 9/19/25.
//

import SwiftUI

struct CompanyDetailView: View {
    @Environment(\.dismiss) private var dismiss
    let company: Company
    let intelItems: [IntelItem]
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                if let first = company.imageURLs.first {
                    Image(first)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 240)
                        .clipped()
                }
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(16)
                }
            }
            VStack(alignment: .leading, spacing: 8) {
                Text(company.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("\(company.hqCity), \(company.hqState)")
                    .foregroundStyle(.secondary)
                HStack(spacing: 8) {
                    Label(company.sectors.joined(separator: ", "), systemImage: "hammer")
                    Label(company.projectTypes.joined(separator: ", "), systemImage: "wrench.and.screwdriver")
                }
                .font(.footnote)
                .foregroundStyle(.secondary)
                Link("Bulldozer profile", destination: URL(string: company.bulldozerProfileURL)!)
                    .font(.footnote)
            }
            .padding(.horizontal)
            .padding(.top, 12)
            Divider()
                .padding(.vertical, 8)
            VStack(alignment: .leading, spacing: 12) {
                Text("Intel")
                    .font(.headline)
                ForEach(intelItems) { item in
                    IntelRowView(item: item)
                        .padding(.vertical, 6)
                }
            }
            .padding(.horizontal)
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea(edges: .top)
    }
}

struct IntelRowView: View {
    let item: IntelItem
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(item.title)
                .font(.subheadline)
                .fontWeight(.semibold)
            Text(item.summary)
                .font(.footnote)
                .foregroundStyle(.secondary)
                .lineLimit(3)
            HStack(spacing: 8) {
                Text(item.sourceType.rawValue.uppercased())
                    .font(.caption2)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(Color(.systemGray6))
                    .clipShape(Capsule())
                if let sentiment = item.sentiment {
                    Label(String(format: "Sentiment %.1f", sentiment), systemImage: "face.smiling")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    CompanyDetailView(company: DeveloperPreview.shared.companies[0], intelItems: DeveloperPreview.shared.intelFeed)
}

