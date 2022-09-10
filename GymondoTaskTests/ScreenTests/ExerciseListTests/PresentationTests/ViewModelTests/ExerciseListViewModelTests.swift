//
//  ExerciseListViewModelTests.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 10/09/2022.
//

import XCTest
import Combine
@testable import GymondoTask

class ExerciseListViewModelTests: XCTestCase {
    
    private var sut: ExerciseListViewModel!
    private var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        sut = .init(loadExercisesUseCase: MockSuccessLoadExercisesUseCase())
    }
    
    override func tearDown() {
        sut = nil
        cancellables.removeAll()
        super.tearDown()
    }
    
    func testSUT_whenExecuteWithSuccess_stateShouldBeSuccess() {
        // Given
        let expectation = self.expectation(description: "Loading Exercises Successfully")
        var expectedState: ViewModelState!
        expectation.expectedFulfillmentCount = 2
        
        // When Init
        
        sut.$state.sink { state in
            expectedState = state
            expectation.fulfill()
        }.store(in: &sut.cancellables)
        wait(for: [expectation], timeout: 1.0)
       
        
        // Then
        XCTAssertEqual(expectedState, .success)
    }
    
    func testSUT_whenExecuteWithSuccess_stateGetData() {
        // Given
        let expectation = self.expectation(description: "Loading Exercises Successfully")
        var expectedResult: [Exercise]!
        expectation.expectedFulfillmentCount = 2
        
        // When Init
        
        sut.$exercises.sink { items in
            expectedResult = items
            expectation.fulfill()
        }.store(in: &sut.cancellables)
        wait(for: [expectation], timeout: 1.0)
       
        
        // Then
        XCTAssertTrue(expectedResult.isNotEmpty)
    }
    
    func testSUT_whenExecuteFailure_stateShouldBeFailure() {
        // Given
        let expectation = self.expectation(description: "Failed Loading")
        var expectedState: ViewModelState!
        expectation.expectedFulfillmentCount = 2
        
        // When
        sut = .init(loadExercisesUseCase: MockFailureLoadExercisesUseCase())
        
        sut.$state.sink { state in
            expectedState = state
            expectation.fulfill()
        }.store(in: &sut.cancellables)
        wait(for: [expectation], timeout: 1.0)
        // When
        
        // Then
        XCTAssertEqual(expectedState, .failure(NetworkError.invalidResponse))
    }
}
