//
//  MockSuccessExerciseInfoService.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 10/09/2022.
//

import Foundation
@testable import GymondoTask
import Combine

class MockSuccessExerciseInfoService: ExerciseInfoServiceContract {
    func loadExerciseInfo(with id: Int) -> AnyPublisher<ExerciseInfoResponse, Error> {
        Just(MockData.exerciseInfoResponse)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
