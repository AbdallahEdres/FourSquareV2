//
//  MoreItemModel.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 03/12/2025.
//

import Foundation
struct MoreItemModel:Identifiable{
    var id: MoreRoutes{ route }
    var name: String { route.title }
    var image: String
    var route: MoreRoutes
}
