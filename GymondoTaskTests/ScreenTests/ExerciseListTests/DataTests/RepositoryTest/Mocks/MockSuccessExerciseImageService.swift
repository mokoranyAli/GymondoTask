//
//  MockSuccessExerciseImageService.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 10/09/2022.
//

import Foundation
@testable import GymondoTask
import Combine

class MockSuccessExerciseImageService: ExerciseImageServiceContract {
    func loadImage(with id: Int) -> AnyPublisher<ExerciseImageResponse, Error> {
        Just(MockData.exerciseImageResponse)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
