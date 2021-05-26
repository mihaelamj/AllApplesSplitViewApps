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

open class MyAllStuffHandler {
  
  let repo = Repository()
  let registrant = AllApplesTableViewRegistrant(tableCellHandler:TableViewCellHandler())
  let tvDataSource: AllApplesTableViewDataSource
  let tvDelegate: AllApplesTableViewDelegate
  
  init(itemDelegate: AllApplesTableViewItemDelegate? = nil) {
    tvDataSource = AllApplesTableViewDataSource(sectionHandlerImplementation: repo,
                                                registrant: registrant)
    tvDelegate = AllApplesTableViewDelegate(itemDelegateImplementation: itemDelegate,
                                            sectionHandlerImplementation: repo,
                                            registrant: registrant)
  }

}
