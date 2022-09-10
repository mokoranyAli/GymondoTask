//
//  VariationsDetailsViewModel.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 09/09/2022.
//

import Foundation

class VariationsDetailsViewModel: BaseViewModel {
    
    let exerciseName : String
    let variation: Int
    init(variation: Int, exerciseName: String) {
        self.variation = variation
        self.exerciseName = exerciseName
    }
}
