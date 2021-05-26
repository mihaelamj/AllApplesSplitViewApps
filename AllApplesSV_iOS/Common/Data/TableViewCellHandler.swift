//
//  TableViewCellHandler.swift
//  AllApplesSV
//
//  Created by Mihaela Mihaljevic Jakic on 26.05.2021..
//

import Foundation
import AllApples
import CollectionUtil
import AllApplesTableViewHandlers

#if os(iOS) || os(tvOS)
import UIKit
#endif

#if os(OSX)
import Cocoa
#endif

class TableViewCellHandler {
  #if os(iOS) || os(tvOS)
  let cellidentifiers = ["CellID_iOS"]
  #endif
  #if os(OSX)
  let cellidentifiers = ["CellID1_macOS", "CellID2_macOS"]
  #endif
  
  #if os(iOS) || os(tvOS)
  let cellClasses = [ATableViewCell.self]
  #endif
  #if os(OSX)
  let cellClasses = [AView.self]
  #endif
}


// MARK: -
// MARK: TableViewCell Stuff -

extension TableViewCellHandler: AllApplesTableViewCellProtocol {
  
  public var tableCellIdentifiers: [String] {
   return cellidentifiers
  }
  
  public var tableCellClassTypes: [CellClassType] {
    return cellClasses
  }
  
  public func tableCellIdentifierFor(indexPath: IndexPath) -> String? {
    return cellidentifiers[safe: indexPath.section]
  }
  
  public func tableCellClassFor(identifier: String) -> CellClassType? {
    guard let index = cellidentifiers.firstIndex(where: { $0 == identifier }) else { return nil }
    return cellClasses[safe: index]
  }
}
