//
//  LoadExerciseImageUseCaseTests.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 10/09/2022.
//

import XCTest
import Combine
@testable import GymondoTask

class LoadExerciseImageUseCaseTests: XCTestCase {
    
    private var sut: LoadExerciseImageUseCase!
    private var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        sut = .init(repository: MockSuccessExerciseImageRepository())
    }
    
    override func tearDown() {
        sut = nil
        cancellables.removeAll()
        super.tearDown()
    }
    
    func testSUT_whenExecuteWithSuccess_shouldGetImageWithURL() {
        // Given
        let expectation = self.expectation(description: "Load Image Succssfully")
        var expectedResult: ExerciseImage!
        
        // When
        sut.execute(id: 174)
            .sink { _ in }
    receiveValue: { item in
        expectedResult = item
        expectation.fulfill()
    }.store(in: &cancellables)
        wait(for: [expectation], timeout: 1.0)
        
        // Then
        XCTAssertNotNil(expectedResult.imageURL)
    }
    
    func testSUT_whenExecuteWithFailure_shouldGetError() {
        // Given
        sut = .init(repository: MockFailureExerciseImageRepository())
        let expectation = self.expectation(description: "Load Image Error")
        var expectedError: NetworkError!
        
        // When
        sut.execute(id: 174)
            .sink { completion in
                if case let .failure(error) = completion {
                    expectedError = error as? NetworkError
                    expectation.fulfill()
                }
            }
    receiveValue: {_ in
    }.store(in: &cancellables)
        wait(for: [expectation], timeout: 1.0)
        
        // Then
        XCTAssertEqual(expectedError, NetworkError.invalidResponse)
    }
}
