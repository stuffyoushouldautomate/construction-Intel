//
//  CompanyService.swift
//  Construction Intel
//
//  Created by AI on 9/19/25.
//

import Foundation

class CompanyService {
    func fetchCompanies() async throws -> [Company] {
        return DeveloperPreview.shared.companies
    }
}

