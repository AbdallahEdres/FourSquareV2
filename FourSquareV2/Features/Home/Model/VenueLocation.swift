//
//  VenueLocation.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 02/12/2025.
//

// MARK: - Location
struct VenueLocation: Codable {
    var address: String?
    var lat, lng: Double?
    var labeledLatLngs: [LabeledLatLng]?
    var distance: Int?
    var postalCode: String?
    var cc: String?
    var city: String?
    var state: String?
    var country: String?
    var formattedAddress: [String]?
    var crossStreet, neighborhood: String?
}
