//
//  IntelGraph.swift
//  Construction Intel
//
//  Created by AI on 9/19/25.
//

import Foundation

class IntelGraph {
    private let aiService: AIInsightsService
    
    init(aiService: AIInsightsService) {
        self.aiService = aiService
    }
    
    func generateAndMergeFeed(baseFeed: [IntelItem]) -> [IntelItem] {
        let insights = aiService.generateScheduledInsights()
        let merged = baseFeed + insights
        // simple sort: newest first
        return merged.sorted(by: { $0.publishedAt > $1.publishedAt })
    }
}

