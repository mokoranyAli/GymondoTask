//
//  ExerciseListServiceTests.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 09/09/2022.
//

import XCTest
import Combine
@testable import GymondoTask

class ExerciseListServiceTests: XCTestCase {
    
    private var cancellables = Set<AnyCancellable>()
    private var sut: ExerciseListService!
    
    override func setUp() {
        super.setUp()
        sut = .init(apiService: MockAPIService(fileName: "Exercises"))
    }
    
    override func tearDown() {
        sut = nil
        cancellables.removeAll()
        super.tearDown()
    }
    
    func testSUT_whenLoadDataSuccessfully_shouldGetTwentyElements() {
        // Given
        let expectation = self.expectation(description: "Load Exercises")
        var expectedItems: [ExerciseResponse]!
        // When
        sut.loadExercises()
            .sink { completion in
            } receiveValue: { list in
                expectedItems = list.results
                expectation.fulfill()
            }.store(in: &cancellables)
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(expectedItems.count, 20)
    }
    
    func testSUT_whenInvalidURL_shouldGetError() {
        // Given
        let expectation = self.expectation(description: "Load Exercises")
        var expectedError: NetworkError!
        sut = .init(apiService: MockAPIService(fileName: "Wrong Name"))
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
        XCTAssertEqual(expectedError, NetworkError.invalidURL)
    }
}

