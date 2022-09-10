//
//  MockSuccessExerciseInfoRepository.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 10/09/2022.
//

import Foundation
@testable import GymondoTask
import Combine

class MockSuccessExerciseInfoRepository: ExerciseInfoRepositoryContract {
    func getExerciseInfo(with id: Int) -> AnyPublisher<ExerciseInfo, Error> {
        Just(MockData.exericesInfo)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
