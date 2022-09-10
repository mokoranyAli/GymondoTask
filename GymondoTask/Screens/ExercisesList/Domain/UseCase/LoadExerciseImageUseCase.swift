//
//  LoadExerciseImageUseCase.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 07/09/2022.
//

import Combine
protocol LoadExerciseImageUseCaseContract {
    func execute(id: Int) -> AnyPublisher<ExerciseImage, Error>
}

class LoadExerciseImageUseCase: LoadExerciseImageUseCaseContract {

    private let repository: ExerciseImageRepositoryContract
    
    init(repository: ExerciseImageRepositoryContract = ExerciseImageRepository()) {
        self.repository = repository
    }
    
    func execute(id: Int) -> AnyPublisher<ExerciseImage, Error> {
        repository.getExerciseImage(with: id)
    }
}
