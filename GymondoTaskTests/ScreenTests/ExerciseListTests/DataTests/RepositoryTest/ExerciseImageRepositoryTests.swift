//
//  ExerciseImageRepositoryTests.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 10/09/2022.
//

import XCTest
@testable import GymondoTask
import Combine

class ExerciseImageRepositoryTests: XCTestCase {
    
    private var sut: ExerciseImageRepository!
    private var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        sut = .init(service: MockSuccessExerciseImageService())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSUT_whenLoadDataSuccessfully_shouldGetData() {
        // Given
        let expectation = self.expectation(description: "Load Image")
        var expectedItem: ExerciseImage!
       
        // When
        sut.getExerciseImage(with: 174)
            .sink { completion in
            } receiveValue: { item in
                expectedItem = item
                expectation.fulfill()
            }.store(in: &cancellables)
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(expectedItem)
    }
    
    func testSUT_whenFailToLoadDataL_shouldGetError() {
        // Given
        let expectation = self.expectation(description: "Load Image")
        var expectedError: NetworkError!
        sut = .init(service: MockFailureExerciseImageService())
        // When
        sut.getExerciseImage(with: 174)
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
