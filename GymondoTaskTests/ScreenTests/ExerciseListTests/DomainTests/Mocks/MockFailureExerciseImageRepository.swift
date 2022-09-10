//
//  MockFailureExerciseImageRepository.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 10/09/2022.
//

import Foundation
@testable import GymondoTask
import Combine

class MockFailureExerciseImageRepository: ExerciseImageRepositoryContract {
    func getExerciseImage(with id: Int) -> AnyPublisher<ExerciseImage, Error> {
        return Fail(error: NetworkError.invalidResponse).eraseToAnyPublisher()
    }
}
