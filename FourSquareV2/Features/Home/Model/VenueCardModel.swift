//
//  VenueCardModel.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 03/12/2025.
//

import Foundation
struct VenueCardModel: Identifiable{
    var id: String?
    var name: String?
    var fullAddress: String?
    var categoryName: String?
    var categoryImageUrl: String?

    init(
        id: String?,
        name: String? = nil,
        fullAddress: String? = nil,
        categoryName: String? = nil,
        categoryImageUrl: String? = nil
    ) {
        self.id = id
        self.name = name
        self.fullAddress = fullAddress
        self.categoryName = categoryName
        self.categoryImageUrl = categoryImageUrl
    }
    //custom init from the VenueDTO
    init(from dto: Venue?) {
        self.id = dto?.id
        self.name = dto?.name
        self.fullAddress = dto?.location?.formattedAddress.flatMap({$0})?.joined(separator: ", ")
        let mainCategory = dto?.categories?.first
        self.categoryName = mainCategory?.name
        self.categoryImageUrl = "\(mainCategory?.icon?.iconPrefix ?? "")32\(mainCategory?.icon?.suffix ?? "")"

    }
}
