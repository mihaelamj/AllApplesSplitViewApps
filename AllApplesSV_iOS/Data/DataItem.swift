//
//  DataItem.swift
//  AllApplesSV
//
//  Created by Mihaela Mihaljevic Jakic on 07.05.2021..
//

import Foundation

class DataItem {
  
  // MARK: -
  // MARK: Data Properties -
  
  var name: String
  var isChecked: Bool
  
  class var none: DataItem {
    return DataItem(name: "none", isChecked: false)
  }
  
  class var some: [DataItem] {
    return [
      DataItem(name: "Item 1", isChecked: false),
      DataItem(name: "Item 2", isChecked: true),
      DataItem(name: "Item 3", isChecked: false),
      DataItem(name: "Item 4", isChecked: true),
      DataItem(name: "Item 5", isChecked: false)
    ]
  }
  
  // MARK: -
  // MARK: Init -
  
  internal init(name: String, isChecked: Bool) {
    self.name = name
    self.isChecked = isChecked
  }
}

