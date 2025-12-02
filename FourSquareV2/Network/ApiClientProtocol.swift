//
//  ApiClientProtocol.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 02/12/2025.
//

import Foundation
import Combine

protocol ApiClientProtocol{
    static func getDataFrom<T: Decodable>(api: ApiRequest, as type: T.Type) -> AnyPublisher<T?, Error>
}
