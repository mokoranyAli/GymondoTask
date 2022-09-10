//
//  ExerciseImageResponse.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 07/09/2022.
//


// MARK: - ExerciseImageResponse
struct ExerciseImageResponse: Decodable {
    let id: Int?
    let uuid: String?
    let exerciseBase: Int?
    let image: String?
    let isMain: Bool?
    let status, style: String?

    enum CodingKeys: String, CodingKey {
        case id, uuid
        case exerciseBase = "exercise_base"
        case image
        case isMain = "is_main"
        case status, style
    }
    
    var domainObject: ExerciseImage {
        .init(id: id, imageURL: image)
    }
}

// MARK: - ExerciseImageResponse
struct ExerciseImage: Decodable, Hashable {
    let id: Int?
    let imageURL: String?
}
