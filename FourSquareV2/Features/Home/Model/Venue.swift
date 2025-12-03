//
//  Venue.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 02/12/2025.
//

// MARK: - Venue
struct Venue: Codable {
    var id, name: String?
    var location: VenueLocation?
    var categories: [Category]?
    var createdAt: Int?
    var venuePage: VenuePage?
}
