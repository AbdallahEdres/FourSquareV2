//
//  HomeRoutes.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 02/12/2025.
//

import Foundation
enum HomeRoutes: Identifiable, Hashable{
    var id: Self { return self }
    case home

    var title: String{
        switch self {
        case .home:
            return "Home"
        }
    }

}
