//
//  HomeCoordinator.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 02/12/2025.
//

import Foundation
import SwiftUI
import Combine

final class HomeCoordinator: HomeCoordinatorProtocol{
    @Published var path: NavigationPath = .init()
    private var root: AnyView?

    func start() -> AnyView {
        if root == nil { root = viewFor(.home)}
        return root!
    }

    func viewFor(_ route: HomeRoutes) -> AnyView {
        switch route {
        case .home:
            return buildHomeView()
        }
    }

    func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url)
        }
    }
}

extension HomeCoordinator{
    private func buildHomeView() -> AnyView{
        let locationManager = LocationManager()
        let vm = HomeViewModel(coordinator: self, locationManager: locationManager)
        let view = HomeView(viewModel: vm)
        return AnyView(view)
    }
}
