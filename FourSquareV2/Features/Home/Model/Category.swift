//
//  Category.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 02/12/2025.
//

// MARK: - Category
struct Category: Codable {
    var id, name, pluralName, shortName: String?
    var icon: Icon?
    var categoryCode: Int?
    var mapIcon, mapTextColor, mapDarkTextColor: String?
    var primary: Bool?
}
