//
//  AIInsightsService.swift
//  Construction Intel
//
//  Created by AI on 9/19/25.
//

import Foundation

class AIInsightsService {
    // Placeholder for OpenAI + LangGraph orchestration handled server-side
    // This client returns preview insights for now
    func generateScheduledInsights() -> [IntelItem] {
        return DeveloperPreview.shared.aiInsights
    }
}

