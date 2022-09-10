//
//  ExerciseInfoRepositoryTests.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 10/09/2022.
//

import XCTest
@testable import GymondoTask
import Combine

class ExerciseInfoRepositoryTests: XCTestCase {
    
    private var sut: ExerciseInfoRepository!
    private var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        sut = .init(service: MockSuccessExerciseInfoService())
    }
    
    override func tearDown() {
        sut = nil
        cancellables.removeAll()
        super.tearDown()
    }
    
    func testSUT_whenLoadDataSuccessfully_getDataWithImagesAndVariations() {
        // Given
        let expectation = self.expectation(description: "Load Exercise Info")
        var expectedItem: ExerciseInfo!
        
        // When
        sut.getExerciseInfo(with: 174)
            .sink { completion in
            } receiveValue: { item in
                expectedItem = item
                expectation.fulfill()
            }.store(in: &cancellables)
        wait(for: [expectation], timeout: 1.0)
        
        // Then
        XCTAssertTrue(expectedItem.variations?.isNotEmpty ?? false)
        XCTAssertTrue(expectedItem.images?.isNotEmpty ?? false)
    }
    
    func testSUT_whenFailToLoadDataL_shouldGetError() {
        // Given
        let expectation = self.expectation(description: "Failure Loading Exercises")
        var expectedError: NetworkError!
        sut = .init(service: MockFailureExerciseInfoService())
        // When
        sut.getExerciseInfo(with: 174)
            .sink { completion in
                
                if case .failure(let error) = completion {
                    expectedError = error as? NetworkError
                    expectation.fulfill()
                }
            } receiveValue: { _ in
                
            }.store(in: &cancellables)
        wait(for: [expectation], timeout: 1.0)
        
        // Then
        XCTAssertNotNil(expectedError)
        XCTAssertEqual(expectedError, .invalidResponse)
    }
}
