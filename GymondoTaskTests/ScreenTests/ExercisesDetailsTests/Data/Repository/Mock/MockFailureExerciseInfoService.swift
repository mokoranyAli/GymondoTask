//
//  MockFailureExerciseInfoService.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 10/09/2022.
//

import Foundation
@testable import GymondoTask
import Combine

class MockFailureExerciseInfoService: ExerciseInfoServiceContract {
    func loadExerciseInfo(with id: Int) -> AnyPublisher<ExerciseInfoResponse, Error> {
        return Fail(error: NetworkError.invalidResponse).eraseToAnyPublisher()
    }
}
