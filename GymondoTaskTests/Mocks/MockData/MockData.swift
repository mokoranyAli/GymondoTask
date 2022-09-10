//
//  MockData.swift
//  GymondoTaskTests
//
//  Created by Mohamed Korany on 09/09/2022.
//

import Foundation
@testable import GymondoTask

struct MockData {
    static let exerciseListResponse: ExerciseListResponse =  {
        .init(count: 20, next: nil, results: [exerciseResponse])
    }()
    
    static let exerciseImageResponse: ExerciseImageResponse  = {
        .init(id: 174, uuid: nil, exerciseBase: nil, image: "URL" , isMain: nil, status: nil, style: nil)
    }()
    
    static let exerciseResponse: ExerciseResponse = {
        .init(id: 174, uuid: nil, name: "Test Exercise", exerciseBase: nil, description: nil, creationDate: nil, category: nil, muscles: nil, musclesSecondary: nil, equipment: nil, language: nil, license: nil, licenseAuthor: nil, variations: variations)
    }()
    
    static let variations: [Int] = {
        [1, 2, 3]
    }()
    
    static let exerciseList: [Exercise] = {
        [.init(id: 174, name: "Test Name", description: "Test Description")]
    }()
    
    static let exerciseImage: ExerciseImage = {
        .init(id: 174, imageURL: "Image URL")
    }()
    
    static let exerciseInfoResponse: ExerciseInfoResponse = {
        .init(id: 174, name: "Test Name", uuid: nil, exerciseBaseID: nil, resultDescription: nil, creationDate: nil, category: nil, muscles: nil, musclesSecondary: nil, equipment: nil, language: nil, license: nil, licenseAuthor: nil, images: [.init(id: 174, uuid: nil, exerciseBase: nil, image: "URL", isMain: nil, status: nil, style: nil)], comments: nil, variations: variations)
    }()
    
    static let exericesInfo: ExerciseInfo = {
        .init(name: "Name", images: [exerciseImage], variations: variations)
    }()
}
