//
//  AppDelegate.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 06/09/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    private var coordinator: ExerciseListCoordinatorProtocol?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupMainWindow()
        return true
    }
    
    private func setupMainWindow() {
        let window = UIWindow()
        window.makeKeyAndVisible()
        self.window = window
        let navigationConroller = UINavigationController()
        self.window?.rootViewController = navigationConroller
        coordinator = ExerciseListCoordinator(navigationController: navigationConroller)
        coordinator?.start()
      }
}
