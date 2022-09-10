//
//  MockSuccessLoadExercisesUseCase.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 10/09/2022.
//

import Foundation
@testable import GymondoTask
import Combine

class MockSuccessLoadExercisesUseCase: LoadExercisesUseCaseContract {
    func execute() -> AnyPublisher<[Exercise], Error> {
        Just(MockData.exerciseList)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
