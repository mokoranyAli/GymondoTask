//
//  MockFailureLoadExerciseInfoUseCase.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 10/09/2022.
//

import Foundation
@testable import GymondoTask
import Combine

class MockFailureLoadExerciseInfoUseCase: LoadExerciseInfoUseCaseContract {
    func execute(with id: Int) -> AnyPublisher<ExerciseInfo, Error> {
        return Fail(error: NetworkError.invalidResponse).eraseToAnyPublisher()
    }
}
