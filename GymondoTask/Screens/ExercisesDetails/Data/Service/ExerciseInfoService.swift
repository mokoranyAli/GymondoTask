//
//  ExerciseInfoService.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 07/09/2022.
//

import Combine
import Foundation

protocol ExerciseInfoServiceContract {
    func loadExerciseInfo(with id: Int) -> AnyPublisher<ExerciseInfoResponse, Error>
}

class ExerciseInfoService: ExerciseInfoServiceContract {
    
    private let apiService: APIServiceContract
    
    init(apiService: APIServiceContract = APIService.shared) {
        self.apiService = apiService
    }
    
    func loadExerciseInfo(with id: Int) -> AnyPublisher<ExerciseInfoResponse, Error> {
        
    let urlString = Constants.url + String(id)
        guard let url = URL(string: urlString) else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        return apiService.request(.init(url: url))
    }
}

private extension ExerciseInfoService {
    enum Constants {
        static let url = "https://wger.de/api/v2/exerciseinfo/"
    }
}
