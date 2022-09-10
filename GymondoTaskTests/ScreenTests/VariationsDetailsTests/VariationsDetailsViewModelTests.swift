//
//  VariationsDetailsViewModelTests.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 10/09/2022.
//

import XCTest
import Combine
@testable import GymondoTask

class VariationsDetailsViewModelTests: XCTestCase {
    
    private var sut: VariationsDetailsViewModel!
    
    override func setUp() {
        super.setUp()
        sut = .init(variation: 55, exerciseName: "Test Name")
    }
    
    override func tearDown() {
        sut = nil
       
        super.tearDown()
    }
    
    func testSUT_whenInit_shouldInistantiateDataAsExpected() {
       // Then
        XCTAssertEqual(sut.variation, 55)
        XCTAssertEqual(sut.exerciseName, "Test Name")
    }
    
    // TODO: - To Be Continue ...
}
