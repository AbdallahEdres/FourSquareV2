//
//  MetaResponse.swift
//  FourSquareV2
//
//  Created by Abdallah Edres on 02/12/2025.
//


struct MetaResponse: Codable {
    var code: Int?
    var errorType, errorDetail, requestID: String?
    
    enum CodingKeys: String, CodingKey {
        case code, errorType, errorDetail
        case requestID = "requestId"
    }
}
