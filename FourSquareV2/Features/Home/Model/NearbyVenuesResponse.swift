//
//  Response.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 02/12/2025.
//

// MARK: - Response
struct NearbyVenuesResponse: Codable {
    var venues: [Venue]?
    var confident: Bool?
}
