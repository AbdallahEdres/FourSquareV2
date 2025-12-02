//
//  ApiRequest.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 02/12/2025.
//

import Foundation
import Alamofire
/// This is an api request builder to use with api caller
struct ApiRequest: URLRequestConvertible{
    var server: String
    var path: String
    var method: Method
    private var httpMethod: HTTPMethod {
        switch method {
        case .connect:
            return .connect
        case .delete:
            return .delete
        case .get:
            return .get
        case .head:
            return .head
        case .options:
            return .options
        case .patch:
            return .patch
        case .post:
            return .post
        case .put:
            return .put
        case .query:
            return .query
        case .trace:
            return .trace
        }
    }
    var params: [String : any Sendable]?
    var body: [String : any Sendable]?

    func asURLRequest() throws -> URLRequest {
        let url = try server.asURL().appending(path: path)
        var req = try URLRequest(url: url, method: httpMethod)
        if let params, !params.isEmpty {
            req = try URLEncoding.default.encode(req, with: params)
        }
        if let body, !body.isEmpty {
            req = try JSONEncoding.default.encode(req, with: body)
        }
        return req
    }

    enum Method{
        case connect
        case delete
        case get
        case head
        case options
        case patch
        case post
        case put
        case query
        case trace
    }
}
