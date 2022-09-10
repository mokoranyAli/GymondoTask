//
//  ExerciseInfoServiceTests.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 10/09/2022.
//

import XCTest
import Combine
@testable import GymondoTask

class ExerciseInfoServiceTests: XCTestCase {
    
    private var cancellables = Set<AnyCancellable>()
    private var sut: ExerciseInfoService!
    
    override func setUp() {
        super.setUp()
        sut = .init(apiService: MockAPIService(fileName: "ExerciseInfo"))
    }
    
    override func tearDown() {
        sut = nil
        cancellables.removeAll()
        super.tearDown()
    }
    
    func testSUT_whenLoadDataSuccessfully_shouldGetData() {
        // Given
        let expectation = self.expectation(description: "Load Exercises Info")
        var expectedItem: ExerciseInfoResponse!
        // When
        sut.loadExerciseInfo(with: 174)
            .sink { completion in
            } receiveValue: { item in
                expectedItem = item
                expectation.fulfill()
            }.store(in: &cancellables)
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(expectedItem)
    }
    
    func testSUT_whenInvalidURL_shouldGetError() {
        // Given
        let expectation = self.expectation(description: "Load Exercises Info")
        var expectedError: NetworkError!
        sut = .init(apiService: MockAPIService(fileName: "Wrong Name"))
        // When
        sut.loadExerciseInfo(with: 174)
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
