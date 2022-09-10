//
//  MockAPIService.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 09/09/2022.
//

@testable import GymondoTask
import Combine
import Foundation

class MockAPIService: APIServiceContract {
    
    let fileName: String
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func request<T>(_ urlReauest: URLRequest) -> AnyPublisher<T, Error> where T : Decodable {
        guard let url = Bundle(for: type(of: self)).url(forResource: fileName, withExtension: "json") else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        do {
            let data = try Data(contentsOf: url)
            let response = try JSONDecoder().decode(T.self, from: data)
            
            return Just(response)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
}
