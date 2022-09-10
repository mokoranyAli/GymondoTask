//
//  LoadExercisesUseCaseTests.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 10/09/2022.
//

import XCTest
import Combine
@testable import GymondoTask

class LoadExercisesUseCaseTests: XCTestCase {
    
    private var sut: LoadExercisesUseCase!
    private var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        sut = .init(repository: MockSuccessExercisesListRepository())
    }
    
    override func tearDown() {
        sut = nil
        cancellables.removeAll()
        super.tearDown()
    }
    
    func testSUT_whenExecuteWithSuccess_shouldGetOneItemWith174ID() {
        let expectation = self.expectation(description: "Load Exercises Succssfully")
        var expectedResult: [Exercise]!
        
        sut.execute()
            .sink { _ in }
    receiveValue: { items in
        expectedResult = items
        expectation.fulfill()
    }.store(in: &cancellables)
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(expectedResult.first?.id, 174)
        XCTAssertEqual(expectedResult.count, 1)
    }
    
    func testSUT_whenExecuteWithFailure_shouldGetError() {
        sut = .init(repository: MockFailureExercisesListRepository())
        let expectation = self.expectation(description: "Load Exercises Error")
        var expectedError: NetworkError!
        
        sut.execute().sink { completion in
            if case let .failure(error) = completion {
                expectedError = error as? NetworkError
                expectation.fulfill()
            }
        }
    receiveValue: {_ in
    }.store(in: &cancellables)
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(expectedError, NetworkError.invalidResponse)
    }
}
