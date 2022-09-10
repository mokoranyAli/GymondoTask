//
//  MockSuccessLoadExerciseImageUseCase.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 10/09/2022.
//

import Foundation
@testable import GymondoTask
import Combine

class MockSuccessLoadExerciseImageUseCase: LoadExerciseImageUseCaseContract {
    func execute(id: Int) -> AnyPublisher<ExerciseImage, Error> {
        Just(MockData.exerciseImage)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
