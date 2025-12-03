//
//  MoreCoordinator.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 03/12/2025.
//

import SwiftUI
import Combine

final class MoreCoordinator: MoreCoordinatorProtocol{
    @Published var path: NavigationPath = .init()
    private var root: AnyView?

    func start() -> AnyView {
        if root == nil { root = AnyView(MoreRootView(coordinator: self))}
        return root!
    }

    func viewFor(_ route: MoreRoutes) -> AnyView {
        switch route {
        default:
            return AnyView(EmptyView())
        }
    }
    func push(_ route: MoreRoutes) {
        path.append(route)
    }
}

extension MoreCoordinator{

}
