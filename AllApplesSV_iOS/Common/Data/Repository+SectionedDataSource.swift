//
//  Repository+SectionedDataSource.swift
//  AllApplesSV
//
//  Created by Mihaela Mihaljevic Jakic on 26.05.2021..
//

import Foundation
import MMJSectionedDataSource
import CollectionUtil

extension Repository: SectionedDataSource {
  
  public func numberOfSections() -> Int {
    return 1
  }
  
  public func sectionTitleAt(_ indexPath: IndexPath) -> String {
    return ""
  }
  
  public func sectionAt(_ indexPath: IndexPath) -> Any? {
    return nil
  }
  
  public func numberOfItemsInSection(_ section: Int) -> Int {
    return items.count
  }
  
  public func itemTitleAt(_ indexPath: IndexPath) -> String {
    return items[safe: indexPath.item]?.name ?? "N/A"
  }
  
  public func sectionlessItemTitleAt(_ index: Int) -> String {
    let indexPath = IndexPath(item: index, section: 0)
    return itemTitleAt(indexPath)
  }
  
  public func itemAt(_ indexPath: IndexPath) -> Any? {
    return items[safe: indexPath.item]
  }
  
  public func sectionlessItemAt(_ index: Int) -> Any? {
    let indexPath = IndexPath(item: index, section: 0)
    return itemAt(indexPath)
  }
  
  public func itemIsCheckedAt(_ indexPath: IndexPath) -> Bool {
    if let item = itemAt(indexPath) as? DataItem {
      return item.isChecked
    }
    return false
  }
  
  public func sectionlessItemIsCheckedAt(_ index: Int) -> Bool {
    let indexPath = IndexPath(item: index, section: 0)
    return itemIsCheckedAt(indexPath)
  }
  
}

