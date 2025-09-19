//
//  Company.swift
//  Construction Intel
//
//  Created by AI on 9/19/25.
//

import Foundation

struct Company: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    let logoImageName: String
    let hqCity: String
    let hqState: String
    let website: String
    let sectors: [String]
    let projectTypes: [String]
    let bulldozerProfileURL: String
    var riskScore: Double
    var lastUpdated: Date
    var imageURLs: [String]
}

