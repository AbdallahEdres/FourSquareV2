//
//  TabBarRoutes.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 02/12/2025.
//

import Foundation
enum TabBarRoutes: Identifiable, Hashable{
    var id: Self { return self }
    case home
    case profile
    case more

    var title: String{
        switch self {
        case .home:
            return "Home"
        case .profile:
            return "Profile"
        case .more:
            return "More"
        }
    }

    var imageName: String{
        switch self {
        case .home:
            return "house.fill"
        case .profile:
            return "person.circle.fill"
        case .more:
            return "ellipsis"

        }
    }
}
