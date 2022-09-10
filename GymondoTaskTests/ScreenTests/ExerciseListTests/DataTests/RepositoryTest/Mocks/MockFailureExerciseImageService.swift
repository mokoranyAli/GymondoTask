//
//  MockFailureExerciseImageService.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 10/09/2022.
//

import Foundation
@testable import GymondoTask
import Combine

class MockFailureExerciseImageService: ExerciseImageServiceContract {
    func loadImage(with id: Int) -> AnyPublisher<ExerciseImageResponse, Error> {
        return Fail(error: NetworkError.invalidResponse).eraseToAnyPublisher()
    }
}
