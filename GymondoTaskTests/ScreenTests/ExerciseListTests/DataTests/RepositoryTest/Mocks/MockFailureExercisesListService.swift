//
//  MockFailureExercisesListService.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 09/09/2022.
//

import Foundation
@testable import GymondoTask
import Combine

class MockFailureExercisesListService: ExerciseListServiceContract {
    func loadExercises() -> AnyPublisher<ExerciseListResponse, Error> {
        return Fail(error: NetworkError.invalidResponse).eraseToAnyPublisher()
    }
}
