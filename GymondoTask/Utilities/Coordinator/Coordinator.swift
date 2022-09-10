//
//  Coordinator.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 06/09/2022.
//

import UIKit

protocol Coordinator {
    
    /// Root navigation controller of the coordinator.
    var navigationController: UINavigationController { get }
    
    /// Starts job of the coordinator.
    func start()
}
