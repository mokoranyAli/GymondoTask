//
//  Array+Helpers.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 09/09/2022.
//

import Foundation

public extension Array {
    /// Variable that returns if Array is empty or not
    var isNotEmpty: Bool {
        return !isEmpty
    }
    
    /// Subscript to avoid out of bounds crashes
    subscript(safe index: Index) -> Element? {
        isValidIndex(index: index) ? self[index] : nil
    }
    
    func isValidIndex(index: Int) -> Bool {
        index >= 0 && index < count
    }
}
