//
//  CompaniesViewModel.swift
//  Construction Intel
//
//  Created by AI on 9/19/25.
//

import Foundation

class CompaniesViewModel: ObservableObject {
    @Published var companies: [Company] = []
    @Published var feedItems: [IntelItem] = []
    private let companyService: CompanyService
    private let feedService: FeedService
    private let aiService: AIInsightsService
    private let graph: IntelGraph
    
    init(companyService: CompanyService = CompanyService(),
         feedService: FeedService = FeedService(),
         aiService: AIInsightsService = AIInsightsService()) {
        self.companyService = companyService
        self.feedService = feedService
        self.aiService = aiService
        self.graph = IntelGraph(aiService: aiService)
        
        Task { await load() }
    }
    
    @MainActor
    func load() async {
        do {
            let fetchedCompanies = try await companyService.fetchCompanies()
            let baseFeed = try await feedService.fetchFeed()
            let combined = graph.generateAndMergeFeed(baseFeed: baseFeed)
            self.companies = fetchedCompanies
            self.feedItems = combined
        } catch {
            print("DEBUG: Failed to load companies or feed: \(error.localizedDescription)")
        }
    }
    
    func intelForCompany(_ company: Company) -> [IntelItem] {
        return feedItems.filter { $0.companyId == company.id }
    }
}

