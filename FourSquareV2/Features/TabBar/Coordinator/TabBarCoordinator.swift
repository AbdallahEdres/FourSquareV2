//
//  TabBarCoordinator.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 02/12/2025.
//

import Foundation
import SwiftUI
import Combine

final class TabBarCoordinator: TabBarCoordinatorProtocol {
    @Published var selectedTap: TabBarRoutes = .home
    @Published var tabs: [TabBarRoutes] = [.home, .profile, .more]
    @Published var root: AnyView?

    func start() -> AnyView {
        if root == nil {
            root = AnyView(TabBarView(coordinator: self))
        }
        return root!
    }
    func viewFor(_ tab: TabBarRoutes) -> AnyView {
        return AnyView(Text(tab.title))
    }
}
