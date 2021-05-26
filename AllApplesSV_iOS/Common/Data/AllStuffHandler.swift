//
//  Registrant.swift
//  AllApplesSV
//
//  Created by Mihaela Mihaljevic Jakic on 26.05.2021..
//

import Foundation
import AllApples
import MMJSectionedDataSource
import CollectionUtil
import AllApplesTableViewHandlers

open class AllStuffHandler {
  weak var itemDelegate: AllApplesTableViewItemDelegate? = nil 
  let repo = Repository()
  let registrant = AllApplesTableViewRegistrant(tableCellHandler:TableViewCellHandler())
  
  public var tvDataSource: AllApplesTableViewDataSource {
    let result = AllApplesTableViewDataSource(sectionHandlerImplementation: repo,
                                              registrant: registrant)
    return result
  }
  
  public var tvDelegate: AllApplesTableViewDelegate {
    let result = AllApplesTableViewDelegate(itemDelegateImplementation: nil,
                                            sectionHandlerImplementation: repo,
                                            registrant: registrant)
    return result
  }
  
  init(itemDelegate: AllApplesTableViewItemDelegate? = nil) {
    self.itemDelegate = itemDelegate
  }

}
