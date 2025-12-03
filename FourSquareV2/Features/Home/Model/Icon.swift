//
//  Icon.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 02/12/2025.
//

// MARK: - Icon
struct Icon: Codable {
    var iconPrefix: String?
    var suffix: String?

    enum CodingKeys: String, CodingKey {
        case iconPrefix = "prefix"
        case suffix
    }
}
