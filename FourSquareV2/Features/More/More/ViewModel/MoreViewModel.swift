//
//  MoreViewModel.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 03/12/2025.
//

import Combine
import Foundation

final class MoreViewModel: MoreViewModelProtocol {
    @Published var moreItems: [MoreItemModel] = [.init(image: "newspaper.fill", route: .terms)]
    let coordinator: any MoreCoordinatorProtocol

    init(coordinator: any MoreCoordinatorProtocol) {
        self.coordinator = coordinator
    }

    func didTab(_ moreItem: MoreItemModel) {
        coordinator.push(moreItem.route)
    }
}
