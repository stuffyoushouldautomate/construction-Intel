//
//  IntelItem.swift
//  Construction Intel
//
//  Created by AI on 9/19/25.
//

import Foundation

enum IntelSourceType: String, Codable, CaseIterable, Identifiable {
    case rss
    case news
    case gov
    case ai
    var id: String { rawValue }
}

struct IntelItem: Identifiable, Codable, Hashable {
    let id: String
    let companyId: String?
    let title: String
    let summary: String
    let sourceURL: String
    let sourceType: IntelSourceType
    let publishedAt: Date
    let tags: [String]
    var sentiment: Double?
    var reliabilityScore: Double?
}

