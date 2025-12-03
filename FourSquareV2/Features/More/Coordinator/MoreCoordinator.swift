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
        case .more:
            return buildMoreView()
        case .terms:
            return buildTermsView()
        }
    }
    func push(_ route: MoreRoutes) {
        path.append(route)
    }
}

extension MoreCoordinator{
    private func buildMoreView() -> AnyView{
        let vm = MoreViewModel(coordinator: self)
        let view = MoreView(viewModel: vm)
        return AnyView(view)
    }
    private func buildTermsView() -> AnyView{
        let vm = TermsViewModel()
        let view = TermsView(viewModel: vm)
        return AnyView(view)
    }
}
