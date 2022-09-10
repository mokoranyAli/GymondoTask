//
//  ExerciseImageService.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 07/09/2022.
//

import Combine
import Foundation

protocol ExerciseImageServiceContract {
    func loadImage(with id: Int) -> AnyPublisher<ExerciseImageResponse, Error>
}

class ExerciseImageService: ExerciseImageServiceContract {
    
    private let apiService: APIServiceContract
    
    init(apiService: APIServiceContract = APIService.shared) {
        self.apiService = apiService
    }
    
    func loadImage(with id: Int) -> AnyPublisher<ExerciseImageResponse, Error> {
        
    let urlString = Constants.url + String(id)
        guard let url = URL(string: urlString) else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        return apiService.request(.init(url: url))
    }
}

private extension ExerciseImageService {
    enum Constants {
        static let url = "https://wger.de/api/v2/exerciseimage/"
    }
}
