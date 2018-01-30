//
//  BaseViewModel.swift
//  Chickens
//
//  Created by Alexander Yakovlev on 11/15/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

import UIKit

protocol BaseViewModel {
  var cellCount: Int { get }
  func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}
