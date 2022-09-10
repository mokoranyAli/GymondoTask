//
//  ExerciseListRepositoryTests.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 09/09/2022.
//

import XCTest
@testable import GymondoTask
import Combine

class ExerciseListRepositoryTests: XCTestCase {
    
    private var sut: ExerciseListRepository!
    private var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        sut = .init(service: MockSuccessExercisesListService())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSUT_whenLoadDataSuccessfully_shouldGetOneItemWith174ID() {
        // Given
        let expectation = self.expectation(description: "Load Exercises")
        var expectedItems: [Exercise]!
        let expectedExerciseID = 174
        var realExerciseID: Int!
        // When
        sut.loadExercises()
            .sink { completion in
            } receiveValue: { items in
                realExerciseID = items.first?.id
                expectedItems = items
                expectation.fulfill()
            }.store(in: &cancellables)
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(expectedItems.count, 1)
        XCTAssertEqual(realExerciseID, expectedExerciseID)
    }
    
    func testSUT_whenFailToLoadDataL_shouldGetError() {
        // Given
        let expectation = self.expectation(description: "Load Exercises")
        var expectedError: NetworkError!
        sut = .init(service: MockFailureExercisesListService())
        // When
        sut.loadExercises()
            .sink { completion in
                
                if case .failure(let error) = completion {
                    expectedError = error as? NetworkError
                    expectation.fulfill()
                }
            } receiveValue: { _ in
                
            }.store(in: &cancellables)
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(expectedError)
        XCTAssertEqual(expectedError, .invalidResponse)
    }
}
