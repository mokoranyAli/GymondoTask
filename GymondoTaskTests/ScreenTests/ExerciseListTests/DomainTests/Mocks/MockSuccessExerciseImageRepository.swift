//
//  MockSuccessExerciseImageRepository.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 10/09/2022.
//

import Foundation
@testable import GymondoTask
import Combine

class MockSuccessExerciseImageRepository: ExerciseImageRepositoryContract {
    func getExerciseImage(with id: Int) -> AnyPublisher<ExerciseImage, Error> {
        Just(MockData.exerciseImage)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
