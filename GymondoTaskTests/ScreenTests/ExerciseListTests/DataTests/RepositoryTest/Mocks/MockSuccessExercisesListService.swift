//
//  MockSuccessExercisesListService.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 09/09/2022.
//

import Foundation
@testable import GymondoTask
import Combine

class MockSuccessExercisesListService: ExerciseListServiceContract {
    func loadExercises() -> AnyPublisher<ExerciseListResponse, Error> {
        Just(MockData.exerciseListResponse)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
