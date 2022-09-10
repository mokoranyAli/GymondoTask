//
//  ExerciseImageServiceTests.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 09/09/2022.
//

import XCTest
import Combine
@testable import GymondoTask

class ExerciseImageServiceTests: XCTestCase {
    
    private var cancellables = Set<AnyCancellable>()
    private var sut: ExerciseImageService!
    
    override func setUp() {
        super.setUp()
        sut = .init(apiService: MockAPIService(fileName: "Image"))
    }
    
    override func tearDown() {
        sut = nil
        cancellables.removeAll()
        super.tearDown()
    }
    
    func testSUT_whenLoadDataSuccessfully_shouldGetValidImage() {
        // Given
        let expectation = self.expectation(description: "Load Image")
        var expectedImage: ExerciseImageResponse!
        // When
        sut.loadImage(with: 174)
            .sink { completion in
            } receiveValue: { item in
                expectedImage = item
                expectation.fulfill()
            }.store(in: &cancellables)
        wait(for: [expectation], timeout: 1.0)
        
        // Then
       XCTAssertNotNil(expectedImage)
        XCTAssertEqual(expectedImage.id, 174)
    }
    
    func testSUT_whenInvalidURL_shouldGetError() {
        // Given
        let expectation = self.expectation(description: "Load Image")
        var expectedError: NetworkError!
        sut = .init(apiService: MockAPIService(fileName: "Wrong Name"))
        // When
        sut.loadImage(with: 174)
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
        XCTAssertEqual(expectedError, NetworkError.invalidURL)
    }
}
