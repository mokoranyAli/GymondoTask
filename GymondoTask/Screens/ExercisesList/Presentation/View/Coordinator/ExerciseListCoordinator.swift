//
//  ExerciseListCoordinator.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 06/09/2022.
//
import UIKit
import SwiftUI

final class ExerciseListCoordinator: ExerciseListCoordinatorProtocol {
    
    // MARK: - Properties
    
    var navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Handlers
    
    func start() {
        showExerciseListViewController()
    }
    
    private func showExerciseListViewController() {
        let viewController = ExercisesListViewController(viewModel: .init())
        viewController.coordinator = self
        self.navigationController.setViewControllers([viewController], animated: false)
    }
}

// MARK: - Default implementation for exercise list navigation
//
protocol ExerciseListCoordinatorProtocol: AnyObject, Coordinator { }

extension ExerciseListCoordinatorProtocol {
    
    func showExerciseDetails(id: Int) {
        let detailsView = ExerciseDetailsView( coordinator: self, viewModel: .init(exerciseID: id))
        let detailsHostingController = UIHostingController(rootView: detailsView)
        navigationController.pushViewController(detailsHostingController, animated: true)
    }
    
    
    func showVariationDetails(variation: Int, exerciseName: String) {
        let variationDetailsView = VariationDetailsView(viewModel: .init(variation: variation, exerciseName: exerciseName))
        let detailsHostingController = UIHostingController(rootView: variationDetailsView)
        navigationController.pushViewController(detailsHostingController, animated: true)
    }
}
