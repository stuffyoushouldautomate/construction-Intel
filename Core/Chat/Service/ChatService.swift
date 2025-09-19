//
//  ChatService.swift
//  Construction Intel
//
//  Created by AI on 9/19/25.
//

import Foundation

enum ChatTool: String, CaseIterable {
    case webSearch
    case companyIntel
}

class ChatService {
    private let companyService: CompanyService
    private let feedService: FeedService
    
    init(companyService: CompanyService = CompanyService(), feedService: FeedService = FeedService()) {
        self.companyService = companyService
        self.feedService = feedService
    }
    
    func detectTool(for input: String) -> ChatTool? {
        let lower = input.lowercased()
        if lower.contains("search") || lower.contains("web") || lower.contains("news") { return .webSearch }
        if lower.contains("company") || lower.contains("intel") || lower.contains("profile") { return .companyIntel }
        return nil
    }
    
    func call(tool: ChatTool, arguments: String) async -> ChatToolResult {
        switch tool {
        case .webSearch:
            // Simulated web search result
            return ChatToolResult(name: tool.rawValue, resultPreview: "Found 3 relevant articles for '" + arguments + "'.")
        case .companyIntel:
            do {
                let companies = try await companyService.fetchCompanies()
                let feed = try await feedService.fetchFeed()
                let filtered = companies.filter { $0.name.lowercased().contains(arguments.lowercased()) }
                if let company = filtered.first {
                    let intel = feed.filter { $0.companyId == company.id }
                    return ChatToolResult(name: tool.rawValue, resultPreview: "\(company.name): \(intel.count) intel items.")
                }
                return ChatToolResult(name: tool.rawValue, resultPreview: "No matching company.")
            } catch {
                return ChatToolResult(name: tool.rawValue, resultPreview: "Error loading intel.")
            }
        }
    }
}

