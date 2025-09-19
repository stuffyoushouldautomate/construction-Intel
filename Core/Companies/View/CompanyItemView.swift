//
//  CompanyItemView.swift
//  Construction Intel
//
//  Created by AI on 9/19/25.
//

import SwiftUI

struct CompanyItemView: View {
    let company: Company
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let first = company.imageURLs.first {
                Image(first)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 220)
                    .clipped()
            }
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(company.name)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("\(company.hqCity), \(company.hqState)")
                        .foregroundStyle(.secondary)
                        .font(.subheadline)
                    Text(company.sectors.joined(separator: ", "))
                        .foregroundStyle(.secondary)
                        .font(.caption)
                }
                Spacer()
                HStack(spacing: 4) {
                    Image(systemName: "shield.lefthalf.filled")
                    Text(String(format: "%.1f", company.riskScore))
                }
                .font(.footnote)
                .foregroundStyle(.primary)
            }
            .padding()
        }
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.black.opacity(0.05), radius: 6, x: 0, y: 3)
    }
}

#Preview {
    CompanyItemView(company: DeveloperPreview.shared.companies[0])
}

