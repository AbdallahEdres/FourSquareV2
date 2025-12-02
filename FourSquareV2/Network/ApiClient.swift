//
//  ApiClient.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 02/12/2025.
//

import Foundation
import Combine
import Alamofire

/// this is a simple implementation of network api caller
/// 
struct ApiClient: ApiClientProtocol{
    static func getDataFrom<T: Decodable>(api: ApiRequest, as type: T.Type) -> AnyPublisher<T?, Error> {
        return Future<T?, Error>{ promise in
            Task{
                do {
                    let req = try api.asURLRequest()
                    let response:T? = try await callApi(request: req)
                    promise(.success(response))
                }catch{
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}

extension ApiClient{

    static private func decode<T: Decodable>(data: Data) throws -> T?{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    static private func handle(_ result: Result<Data, AFError>) throws -> Data {
        switch result {
        case .success(let data):
            return data
        case .failure(let error):
            throw error
        }
    }
    static private func callApi<T:Decodable>(request: URLRequest)async throws -> T?{
        let response = await AF.request(request).serializingData().result
        let data = try handle(response)
        let decoded:T? = try decode(data: data)
        return decoded
    }
}
