//
//  UITableView+Helpers.swift
//  GymondoTask
//
//  Created by Mohamed Korany on 06/09/2022.
//

import UIKit

// MARK: - UITableView + Hanldlers
//
extension UITableView {
  
  
  func registerCellNib<T: UITableViewCell>(_: T.Type, reuseIdentifier: String? = nil) {
    let nibName = reuseIdentifier ?? T.classNameWithoutNamespaces
    self.register(T.loadNib(), forCellReuseIdentifier: nibName)
  }
  
  /// Dequeue cell with generics
  func dequeue<T: UITableViewCell>(_: T.Type) -> T {
    guard
      let cell = dequeueReusableCell(withIdentifier: String(describing: T.self)) as? T
    else { fatalError("Could not deque cell with type \(T.self)") }
    
    return cell
  }
}
