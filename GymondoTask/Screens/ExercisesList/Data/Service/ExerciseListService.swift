//
//  ExerciseListService.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 06/09/2022.
//

import Combine
import Foundation

protocol ExerciseListServiceContract {
    func loadExercises() -> AnyPublisher<ExerciseListResponse, Error>
}

class ExerciseListService: ExerciseListServiceContract {
    
    private let apiService: APIServiceContract
    
    init(apiService: APIServiceContract = APIService.shared) {
        self.apiService = apiService
    }
    
    func loadExercises() -> AnyPublisher<ExerciseListResponse, Error> {
        guard let finalURL = URL(string: Constants.url) else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        return apiService.request(.init(url: finalURL))
    }
}

private extension ExerciseListService {
    enum Constants {
        static let url = "https://wger.de/api/v2/exercise/"
    }
}
