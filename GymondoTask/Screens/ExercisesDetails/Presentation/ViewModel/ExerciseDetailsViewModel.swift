//
//  ExerciseDetailsViewModel.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 07/09/2022.
//

import Combine
import Foundation

class ExerciseDetailsViewModel: BaseViewModel {
    
    private let loadExerciseInfoUseCase: LoadExerciseInfoUseCaseContract
    private let exerciseID: Int
    @Published var exerciseInfo: ExerciseInfo?
    
    init(
        exerciseID: Int,
        loadExerciseInfoUseCase: LoadExerciseInfoUseCaseContract = LoadExerciseInfoUseCase()
    ) {
        self.exerciseID = exerciseID
        self.loadExerciseInfoUseCase = loadExerciseInfoUseCase
        super.init()
        self.loadInfo()
    }
    
    private func loadInfo() {
        state = .loading
        loadExerciseInfoUseCase
            .execute(with: exerciseID)
            .receive(on: RunLoop.main)
            .sink { completion in
                if case let .failure(error) = completion {
                    self.state = .failure(error)
                    self.alertItem = self.state.alertItem
                }
            } receiveValue: { info in
                self.exerciseInfo = info
                self.state = .success
            }.store(in: &cancellables)
    }
    
    var images: [ExerciseImage] {
        return exerciseInfo?.images ?? []
    }
    
    var variations: [Int] {
        return exerciseInfo?.variations ?? []
    }

}
