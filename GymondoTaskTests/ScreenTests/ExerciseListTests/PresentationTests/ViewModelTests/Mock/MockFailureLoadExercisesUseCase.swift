//
//  MockFailureLoadExercisesUseCase.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 10/09/2022.
//

import Foundation
@testable import GymondoTask
import Combine

class MockFailureLoadExercisesUseCase: LoadExercisesUseCaseContract {
    func execute() -> AnyPublisher<[Exercise], Error> {
        return Fail(error: NetworkError.invalidResponse).eraseToAnyPublisher()
    }
}
