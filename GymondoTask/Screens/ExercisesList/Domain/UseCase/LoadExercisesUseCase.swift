//
//  LoadExercisesUseCase.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 06/09/2022.
//

import Combine

protocol LoadExercisesUseCaseContract {
    func execute() -> AnyPublisher<[Exercise], Error>
}

class LoadExercisesUseCase: LoadExercisesUseCaseContract {

    private let repository: ExerciseListRepositoryContract
    
    init(repository: ExerciseListRepositoryContract = ExerciseListRepository()) {
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[Exercise], Error> {
        repository.loadExercises()
    }
}
