//
//  CompaniesView.swift
//  Construction Intel
//
//  Created by AI on 9/19/25.
//

import SwiftUI

struct CompaniesView: View {
    @StateObject private var viewModel = CompaniesViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.companies) { company in
                        NavigationLink(value: company) {
                            CompanyItemView(company: company)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Companies")
            .navigationDestination(for: Company.self) { company in
                CompanyDetailView(company: company, intelItems: viewModel.intelForCompany(company))
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    CompaniesView()
}

