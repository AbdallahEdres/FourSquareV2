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
        switch tab {
        case .home:
            return buildHomeCycle()
        case .profile:
            return AnyView(Text(tab.title))
        case .more:
            return buildMoreCycle()
        }
    }
}

extension TabBarCoordinator{
    private func buildHomeCycle()-> AnyView{
        let coordinator = HomeCoordinator()
        return coordinator.start()
    }
    private func buildMoreCycle()-> AnyView{
        let coordinator = MoreCoordinator()
        return coordinator.start()
    }
}
