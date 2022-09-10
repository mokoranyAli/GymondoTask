//
//  NetworkError.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 06/09/2022.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case decoding(Error)
    case invalidURL
}

extension NetworkError: Equatable {
    static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidResponse, .invalidResponse),
            (.invalidURL, .invalidURL):
            return true
        case (.decoding(let lhsError), .decoding(let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        default:
            return false
        }
    }
}
