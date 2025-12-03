//
//  MoreViewModelProtocol.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 03/12/2025.
//

import Foundation
import Combine
protocol MoreViewModelProtocol: ObservableObject{
    var moreItems: [MoreItemModel]  { get }
    func didTab(_ moreItem: MoreItemModel)
}
