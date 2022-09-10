//
//  ExerciseListRepository.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 06/09/2022.
//

import Combine

protocol ExerciseListRepositoryContract {
    func loadExercises() -> AnyPublisher<[Exercise], Error>
}

class ExerciseListRepository: ExerciseListRepositoryContract {

    private let service: ExerciseListServiceContract
    
    init(service: ExerciseListServiceContract = ExerciseListService()) {
        self.service = service
    }
    
    func loadExercises() -> AnyPublisher<[Exercise], Error> {
        service.loadExercises()
            .map { $0.results ?? [] }
            .map {
                 $0.map { $0.domainObject }
            }.eraseToAnyPublisher()
    }
}
