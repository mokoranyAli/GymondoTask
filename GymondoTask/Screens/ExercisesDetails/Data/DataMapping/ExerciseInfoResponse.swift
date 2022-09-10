//
//  ExerciseInfoResponse.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 09/09/2022.
//

import Foundation

// MARK: - ExerciseInfoResponse
struct ExerciseInfoResponse: Decodable {
    let id: Int?
    let name, uuid: String?
    let exerciseBaseID: Int?
    let resultDescription, creationDate: String?
    let category: Category?
    let muscles, musclesSecondary: [Muscle]?
    let equipment: [Category]?
    let language, license: Language?
    let licenseAuthor: String?
    let images: [ExerciseImageResponse]?
    let comments: [Comment]?
    let variations: [Int]?

    enum CodingKeys: String, CodingKey {
        case id, name, uuid
        case exerciseBaseID = "exercise_base_id"
        case resultDescription = "description"
        case creationDate = "creation_date"
        case category, muscles
        case musclesSecondary = "muscles_secondary"
        case equipment, language, license
        case licenseAuthor = "license_author"
        case images, comments, variations
    }
    
    var domainObject: ExerciseInfo {
        .init(name: name, images: images?.map { $0.domainObject }, variations: variations)
    }
}

// MARK: - Category
struct Category: Codable {
    let id: Int?
    let name: String?
}

// MARK: - Comment
struct Comment: Codable {
    let id, exercise: Int?
    let comment: String?
}


// MARK: - Language
struct Language: Codable {
    let id: Int?
    let shortName, fullName: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case id
        case shortName = "short_name"
        case fullName = "full_name"
        case url
    }
}

// MARK: - Muscle
struct Muscle: Codable {
    let id: Int?
    let name, nameEn: String?
    let isFront: Bool?
    let imageURLMain, imageURLSecondary: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case nameEn = "name_en"
        case isFront = "is_front"
        case imageURLMain = "image_url_main"
        case imageURLSecondary = "image_url_secondary"
    }
}
