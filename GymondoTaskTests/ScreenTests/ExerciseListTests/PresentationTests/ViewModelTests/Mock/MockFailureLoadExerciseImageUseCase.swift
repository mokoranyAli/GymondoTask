//
//  MockFailureLoadExerciseImageUseCase.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 10/09/2022.
//

import Foundation
@testable import GymondoTask
import Combine

class MockFailureLoadExerciseImageUseCase: LoadExerciseImageUseCaseContract {
    func execute(id: Int) -> AnyPublisher<ExerciseImage, Error> {
        return Fail(error: NetworkError.invalidResponse).eraseToAnyPublisher()
    }
}
