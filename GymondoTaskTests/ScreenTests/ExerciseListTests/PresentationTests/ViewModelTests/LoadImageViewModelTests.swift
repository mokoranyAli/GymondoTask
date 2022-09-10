//
//  LoadImageViewModelTests.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 10/09/2022.
//

import XCTest
import Combine
@testable import GymondoTask

class LoadImageViewModelTests: XCTestCase {
    
    private var sut: LoadImageViewModel!
    private var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        sut = .init(loadImageUseCase: MockSuccessLoadExerciseImageUseCase())
    }
    
    override func tearDown() {
        sut = nil
        cancellables.removeAll()
        super.tearDown()
    }
    
    func testSUT_whenExecuteWithSuccess_stateShouldBeSuccess() {
        // Given
        let expectation = self.expectation(description: "Loading Image Successfully")
        var expectedState: ViewModelState!
        expectation.expectedFulfillmentCount = 2
        
        // When
        sut.loadImageURL(id: 174)
        
        sut.$state.sink { state in
            expectedState = state
            expectation.fulfill()
        }.store(in: &sut.cancellables)
        wait(for: [expectation], timeout: 1.0)
       
        
        // Then
        XCTAssertEqual(expectedState, .success)
    }
    
    func testSUT_whenExecuteWithSuccess_shouldGetImageURL() {
        // Given
        let expectation = self.expectation(description: "Loading Image Successfully")
        var expectedURL: String!

        // When
        sut.loadImageURL(id: 174)
        
        sut.$imageURL
            .sink { url in
            expectedURL = url
            expectation.fulfill()
        }.store(in: &sut.cancellables)
        wait(for: [expectation], timeout: 1.0)
       
        
        // Then
        XCTAssertNil(expectedURL)
    }
    
    func testSUT_whenExecuteFailure_stateShouldBeFailure() {
        // Given
        let expectation = self.expectation(description: "Failed Loading")
        var expectedState: ViewModelState!
        expectation.expectedFulfillmentCount = 2
        sut = .init(loadImageUseCase: MockFailureLoadExerciseImageUseCase())
        
        // When
        sut.loadImageURL(id: 174)
        
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
