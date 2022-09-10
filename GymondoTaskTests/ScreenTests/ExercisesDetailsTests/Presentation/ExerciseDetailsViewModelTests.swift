//
//  ExerciseDetailsViewModelTests.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 10/09/2022.
//

import XCTest
import Combine
@testable import GymondoTask

class ExerciseDetailsViewModelTests: XCTestCase {
    
    private var sut: ExerciseDetailsViewModel!
    private var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        sut = .init(exerciseID: 174, loadExerciseInfoUseCase: MockSuccessLoadExerciseInfoUseCase())
    }
    
    override func tearDown() {
        sut = nil
        cancellables.removeAll()
        super.tearDown()
    }
    
    func testSUT_whenExecuteWithSuccess_stateShouldBeSuccess() {
        // Given
        let expectation = self.expectation(description: "Loading Exercise Info Successfully")
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
    
    func testSUT_whenExecuteWithSuccess_shouldGetValidExerciseInfo() {
        // Given
        let expectation = self.expectation(description: "Loading Exercise Info Successfully")
        var expectedResult: ExerciseInfo!
        expectation.expectedFulfillmentCount = 2
        // When Init
        
        sut.$exerciseInfo.sink { info in
            expectedResult = info
            expectation.fulfill()
        }.store(in: &sut.cancellables)
        wait(for: [expectation], timeout: 1.0)
       
        // Then
        XCTAssertNotNil(expectedResult)
        XCTAssertTrue(sut.variations.isNotEmpty)
        XCTAssertTrue(sut.images.isNotEmpty)
    }
    
    func testSUT_whenExecuteFailure_stateShouldBeFailure() {
        // Given
        let expectation = self.expectation(description: "Failed Loading")
        var expectedState: ViewModelState!
        expectation.expectedFulfillmentCount = 2
        
        // When
        sut = .init(exerciseID: 174, loadExerciseInfoUseCase: MockFailureLoadExerciseInfoUseCase())
        
        sut.$state.sink { state in
            expectedState = state
            expectation.fulfill()
        }.store(in: &sut.cancellables)
        wait(for: [expectation], timeout: 1.0)
        
        // Then
        XCTAssertEqual(expectedState, .failure(NetworkError.invalidResponse))
    }
    
    func testSUT_whenExecuteFailure_shouldGetAlertItem() {
        // Given
        let expectation = self.expectation(description: "Failed Loading")
        var expectedItem: AlertItem!
        expectation.expectedFulfillmentCount = 2
        
        // When
        sut = .init(exerciseID: 174, loadExerciseInfoUseCase: MockFailureLoadExerciseInfoUseCase())
        
        sut.$alertItem.sink { item in
            expectedItem = item
            expectation.fulfill()
        }.store(in: &sut.cancellables)
        wait(for: [expectation], timeout: 1.0)
        
        // Then
        XCTAssertNotNil(expectedItem)
    }
}
