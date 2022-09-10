//
//  ExerciseImageRepository.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 07/09/2022.
//

import Combine

protocol ExerciseImageRepositoryContract {
    func getExerciseImage(with id: Int) -> AnyPublisher<ExerciseImage, Error>
}

class ExerciseImageRepository: ExerciseImageRepositoryContract {

    private let service: ExerciseImageServiceContract
    
    init(service: ExerciseImageServiceContract = ExerciseImageService()) {
        self.service = service
    }
    
    func getExerciseImage(with id: Int) -> AnyPublisher<ExerciseImage, Error> {
        service.loadImage(with: id)
            .map { $0.domainObject  }
            .eraseToAnyPublisher()
    }
}
