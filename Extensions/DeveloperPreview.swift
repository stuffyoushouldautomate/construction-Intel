//
//  DeveloperPreview.swift
//  AirBnb
//
//  Created by Kumaran Nathan on 2/3/24.
//

import Foundation

class DeveloperPreview {
    static let shared = DeveloperPreview()
    var listings: [Listing]  = [
        .init(
             id: NSUUID().uuidString,
             ownerUid: NSUUID().uuidString,
             ownerName: "Lewis Hamiliton",
             ownnerImageURL: "lewis-pfp",
             numberOfBedrooms: 4,
             numberOfBathrooms: 3,
             numberOfGuests: 4,
             numberOfBeds: 4,
             PricePerNight: 567,
             latitude: 25.7850,
             longitude: -80.1936,
             imageURLS: ["listing-2", "listing-1", "listing-4", "listing-4"],
             address: "124 Main St",
             city: "Miami",
             state: "Florida",
             title: "Miami Villa",
             rating: 4.86,
             features: [ .superHost, .selfCheckin],
             amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
             type: .villa
             ),
        .init(
             id: NSUUID().uuidString,
             ownerUid: NSUUID().uuidString,
             ownerName: "Roman Roy",
             ownnerImageURL: "roman-pfp",
             numberOfBedrooms: 4,
             numberOfBathrooms: 3,
             numberOfGuests: 4,
             numberOfBeds: 4,
             PricePerNight: 712,
             latitude: 25.7050,
             longitude: -80.1936,
             imageURLS: ["listing-6", "listing-5", "listing-2", "listing-1"],
             address: "321 South St",
             city: "Miami",
             state: "Florida",
             title: "Stunning Miami apartment in downtown Brickell",
             rating: 4.23,
             features: [ .superHost, .selfCheckin],
             amenities: [.wifi, .office, .balcony, .laundry, .tv],
             type: .apartment
             ),
        .init(
             id: NSUUID().uuidString,
             ownerUid: NSUUID().uuidString,
             ownerName: "Ryomen Sukuna",
             ownnerImageURL: "sukuna-pfp",
             numberOfBedrooms: 1,
             numberOfBathrooms: 1,
             numberOfGuests: 2,
             numberOfBeds: 2,
             PricePerNight: 1323,
             latitude: 34.1,
             longitude: -118.1426,
             imageURLS: ["listing-7", "listing-3", "listing-6", "listing-4"],
             address: "321 Hollywood Blvd",
             city: "Los Angeles",
             state: "California",
             title: "Beatiful Los Angeles home in Hollywood Hills",
             rating: 4.88,
             features: [ .superHost, .selfCheckin],
             amenities: [.wifi, .pool, .balcony, .tv, .kitchen],
             type: .house
             ),
        .init(
             id: NSUUID().uuidString,
             ownerUid: NSUUID().uuidString,
             ownerName: "Ben Cahn",
             ownnerImageURL: "male-profile-picture",
             numberOfBedrooms: 3,
             numberOfBathrooms: 2,
             numberOfGuests: 5,
             numberOfBeds: 4,
             PricePerNight: 1620,
             latitude: 34.1,
             longitude: -120.1426,
             imageURLS: ["listing-8", "listing-1", "listing-4", "listing-2"],
             address: "7699 Hollywood Blvd",
             city: "Los Angeles",
             state: "California",
             title: "Beatiful Los Angeles Villa in Suburbs",
             rating: 4.88,
             features: [ .superHost, .selfCheckin],
             amenities: [.wifi, .pool, .balcony, .tv, .kitchen, .alarmSystem],
             type: .villa
             ),
        .init(
             id: NSUUID().uuidString,
             ownerUid: NSUUID().uuidString,
             ownerName: "Jamie Park",
             ownnerImageURL: "kyla-pfp",
             numberOfBedrooms: 5,
             numberOfBathrooms: 3,
             numberOfGuests: 6,
             numberOfBeds: 4,
             PricePerNight: 7966,
             latitude: 42.23409650292578,
             longitude: -83.6694234859318,
             imageURLS: ["emma-5", "emma-3", "emma-2", "emma-1"],
             address: "7699 Hollywood Blvd",
             city: "Los Angeles",
             state: "California",
             title: "Unique Los Angeles Villa surronded by nature",
             rating: 4.88,
             features: [ .superHost, .selfCheckin],
             amenities: [.wifi, .pool, .balcony, .tv, .kitchen, .alarmSystem],
             type: .villa
             ),
        ]

    var companies: [Company] = [
        .init(
            id: UUID().uuidString,
            name: "Metro Paving & Excavation",
            logoImageName: "listing-1",
            hqCity: "Newark",
            hqState: "New Jersey",
            website: "https://example.com/metro",
            sectors: ["Heavy Civil", "Utilities"],
            projectTypes: ["Roadwork", "Sewer", "Site Prep"],
            bulldozerProfileURL: "https://bulldozer.example/metro",
            riskScore: 7.8,
            lastUpdated: Date(),
            imageURLs: ["listing-1", "listing-2", "listing-4"]
        ),
        .init(
            id: UUID().uuidString,
            name: "Hudson Steel & Crane",
            logoImageName: "listing-3",
            hqCity: "Jersey City",
            hqState: "New Jersey",
            website: "https://example.com/hudson",
            sectors: ["Structural Steel", "Cranes"],
            projectTypes: ["High-Rise", "Industrial"],
            bulldozerProfileURL: "https://bulldozer.example/hudson",
            riskScore: 6.3,
            lastUpdated: Date(),
            imageURLs: ["listing-3", "listing-6"]
        ),
        .init(
            id: UUID().uuidString,
            name: "Empire Transit Builders",
            logoImageName: "listing-5",
            hqCity: "Brooklyn",
            hqState: "New York",
            website: "https://example.com/empire",
            sectors: ["Transit", "Rail"],
            projectTypes: ["Stations", "Track", "Tunnels"],
            bulldozerProfileURL: "https://bulldozer.example/empire",
            riskScore: 8.9,
            lastUpdated: Date(),
            imageURLs: ["listing-5", "listing-7", "listing-8"]
        )
    ]

    lazy var intelFeed: [IntelItem] = {
        let companies = self.companies
        let c0 = companies[0].id
        let c1 = companies[1].id
        let c2 = companies[2].id
        return [
            .init(
                id: UUID().uuidString,
                companyId: c2,
                title: "MTA board advances Brooklyn station rehab bid",
                summary: "Capital plan item moves to procurement; potential scope includes crane-heavy weekend outages.",
                sourceURL: "https://mta.gov/news/example",
                sourceType: .gov,
                publishedAt: Date().addingTimeInterval(-60*60*12),
                tags: ["Transit", "Procurement", "Brooklyn"],
                sentiment: 0.2,
                reliabilityScore: 0.95
            ),
            .init(
                id: UUID().uuidString,
                companyId: c0,
                title: "Newark awards sewer upgrade pre-construction",
                summary: "City council minutes note notice to proceed expected next month.",
                sourceURL: "https://newarknj.gov/council/minutes",
                sourceType: .gov,
                publishedAt: Date().addingTimeInterval(-60*60*24*2),
                tags: ["Utilities", "Sewer", "Newark"],
                sentiment: 0.1,
                reliabilityScore: 0.9
            ),
            .init(
                id: UUID().uuidString,
                companyId: c1,
                title: "Steel deliveries tighten as demand surges in Hudson County",
                summary: "Trade publication reports multi-month backlog; crane rental rates rising.",
                sourceURL: "https://news.example/steel-hudson",
                sourceType: .news,
                publishedAt: Date().addingTimeInterval(-60*60*6),
                tags: ["Steel", "Cranes", "Supply Chain"],
                sentiment: -0.3,
                reliabilityScore: 0.7
            )
        ]
    }()

    lazy var aiInsights: [IntelItem] = {
        let companies = self.companies
        return [
            .init(
                id: UUID().uuidString,
                companyId: companies[2].id,
                title: "Opportunity: Empire likely bidder on Brooklyn station rehab",
                summary: "Based on past awards, scope fit, and geography, probability of participation ~72%.",
                sourceURL: "https://intel.ai/generated",
                sourceType: .ai,
                publishedAt: Date().addingTimeInterval(-60*30),
                tags: ["Opportunity", "Brooklyn", "Transit"],
                sentiment: 0.4,
                reliabilityScore: 0.6
            )
        ]
    }()

        
        
        
        
}
