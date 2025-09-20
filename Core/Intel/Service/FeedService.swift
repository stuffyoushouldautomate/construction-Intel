//
//  FeedService.swift
//  Construction Intel
//
//  Created by AI on 9/19/25.
//

import Foundation

class FeedService {
    func fetchFeed() async throws -> [IntelItem] {
        return DeveloperPreview.shared.intelFeed
    }
}

