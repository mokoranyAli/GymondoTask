//
//  ExerciseInfoRepository.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 07/09/2022.
//

import Combine

protocol ExerciseInfoRepositoryContract {
    func getExerciseInfo(with id: Int) -> AnyPublisher<ExerciseInfo, Error>
}

class ExerciseInfoRepository: ExerciseInfoRepositoryContract {
    
    private let service: ExerciseInfoServiceContract
    
    init(service: ExerciseInfoServiceContract = ExerciseInfoService()) {
        self.service = service
    }
    
    func getExerciseInfo(with id: Int) -> AnyPublisher<ExerciseInfo, Error> {
        service.loadExerciseInfo(with: id)
            .map { $0.domainObject  }
            .eraseToAnyPublisher()
    }
}
