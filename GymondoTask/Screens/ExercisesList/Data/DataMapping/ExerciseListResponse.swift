//
//  ExerciseListResponse.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 06/09/2022.
//

import Foundation

// MARK: - Welcome
struct ExerciseListResponse: Codable {
    let count: Int?
    let next: String?
    let results: [ExerciseResponse]?
}

// MARK: - Result
struct ExerciseResponse: Codable {
    let id: Int?
    let uuid, name: String?
    let exerciseBase: Int?
    let description, creationDate: String?
    let category: Int?
    let muscles, musclesSecondary, equipment: [Int]?
    let language, license: Int?
    let licenseAuthor: String?
    let variations: [Int]?

    enum CodingKeys: String, CodingKey {
        case id, uuid, name
        case exerciseBase = "exercise_base"
        case description 
        case creationDate = "creation_date"
        case category, muscles
        case musclesSecondary = "muscles_secondary"
        case equipment, language, license
        case licenseAuthor = "license_author"
        case variations
    }
    
    /// This is to change from backend model to domain model
    var domainObject: Exercise {
        .init(id: id, name: name, description: description)
    }
}
