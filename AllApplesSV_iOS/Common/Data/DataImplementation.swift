//
//  DataImplementation.swift
//  AllApplesSV
//
//  Created by Mihaela Mihaljevic Jakic on 07.05.2021..
//

import Foundation
import AllApples

#if os(iOS) || os(tvOS)
import UIKit
#endif

#if os(OSX)
import Cocoa
#endif

class DataImplementation {
  
  // MARK: -
  // MARK: Data Properties -

  #if os(iOS) || os(tvOS)
  let cellidentifiers = ["ItemCellID"]
  #endif
  #if os(OSX)
  let cellidentifiers = ["NameCellID", "StatusCellID"]
  #endif
  
  #if os(iOS) || os(tvOS)
  let cellClasses = [ATableViewCell.self]
  #endif
  #if os(OSX)
  let cellClasses = [AView.self]
  #endif
  
  var items: [DataItem] = DataItem.some
}

// MARK: -
// MARK: TableViewCell Stuff -

extension DataImplementation: TableViewCellProtocol {
  
  var tableCellIdentifiers: [String] {
   return cellidentifiers
  }
  
  var tableCellClassTypes: [CellClassType] {
    return cellClasses
  }
  
  func tableCellIdentifierFor(indexPath: IndexPath) -> String? {
    return cellidentifiers[safe: indexPath.section]
  }
  
  func tableCellClassFor(identifier: String) -> CellClassType? {
    guard let index = cellidentifiers.firstIndex(where: { $0 == identifier }) else { return nil }
    return cellClasses[safe: index]
  }
}


// MARK: -
// MARK: TableView Stuff -

extension DataImplementation: SectionedDataSource {
  
  func numberOfSections() -> Int {
    return 1
  }
  
  func sectionTitleAt(_ indexPath: IndexPath) -> String {
    return ""
  }
  
  func sectionAt(_ indexPath: IndexPath) -> Any? {
    return nil
  }
  
  func numberOfItemsInSection(_ section: Int) -> Int {
    return items.count
  }
  
  func itemTitleAt(_ indexPath: IndexPath) -> String {
    return items[safe: indexPath.item]?.name ?? "N/A"
  }
  
  func sectionlessItemTitleAt(_ index: Int) -> String {
    let indexPath = IndexPath(item: index, section: 0)
    return itemTitleAt(indexPath)
  }
  
  func itemAt(_ indexPath: IndexPath) -> Any? {
    return items[safe: indexPath.item]
  }
  
  func sectionlessItemAt(_ index: Int) -> Any? {
    let indexPath = IndexPath(item: index, section: 0)
    return itemAt(indexPath)
  }
  
  func itemIsCheckedAt(_ indexPath: IndexPath) -> Bool {
    if let item = itemAt(indexPath) as? DataItem {
      return item.isChecked
    }
    return false
  }
  
  func sectionlessItemIsCheckedAt(_ index: Int) -> Bool {
    let indexPath = IndexPath(item: index, section: 0)
    return itemIsCheckedAt(indexPath)
  }
  
}
