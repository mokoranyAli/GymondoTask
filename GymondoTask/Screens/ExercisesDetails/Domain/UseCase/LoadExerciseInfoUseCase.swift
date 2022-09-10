//
//  LoadExerciseInfoUseCase.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 07/09/2022.
//

import Combine
protocol LoadExerciseInfoUseCaseContract {
    func execute(with id: Int) -> AnyPublisher<ExerciseInfo, Error>
}

class LoadExerciseInfoUseCase: LoadExerciseInfoUseCaseContract {

    private let repository: ExerciseInfoRepositoryContract
    
    init(repository: ExerciseInfoRepositoryContract = ExerciseInfoRepository()) {
        self.repository = repository
    }
    
    func execute(with id: Int) -> AnyPublisher<ExerciseInfo, Error> {
        repository.getExerciseInfo(with: id)
    }
}
