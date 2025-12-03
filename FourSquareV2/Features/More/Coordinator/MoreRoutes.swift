//
//  MoreRoutes.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 03/12/2025.
//

import Foundation
enum MoreRoutes: Identifiable, Hashable{
    var id: Self { return self }
    case more
    case terms

    var title: String{
        switch self {
        case .more:
            return "More"
        case .terms:
            return "Terms & Conditions"
        }
    }

}
