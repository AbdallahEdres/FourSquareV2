//
//  TabBarCoordinatorProtocol.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 02/12/2025.
//

import Foundation
import SwiftUI

protocol TabBarCoordinatorProtocol: ObservableObject{
    var selectedTap: TabBarRoutes { get set }
    var tabs: [TabBarRoutes] { get }

    func start() -> AnyView
    func viewFor(_ tab: TabBarRoutes) -> AnyView
}
