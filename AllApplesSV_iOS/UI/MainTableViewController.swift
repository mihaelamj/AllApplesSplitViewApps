//
//  MainTableViewController.swift
//  AllApplesSV_iOS
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

class MainTableViewController: AViewController {
  
  // MARK: -
  // MARK: UI Properties -
  
  private lazy var tableView: ATableView = {
    let tv = ATableView()
    
//    tv.dataSource = animData
//    tv.delegate = animData
    
    #if os(iOS) || os(tvOS)
    tv.rowHeight = 50.0
    tv.sectionHeaderHeight = 50.0
    #endif
    
    #if os(OSX)
    tv.rowHeight = 30.0
    #endif
    
    return tv
  }()
  
}

// MARK: -
// MARK: Item Delegate -

extension MainTableViewController: ItemDelegate {
  
  func didTapOn(dataSource: Any, item: Any) {
    guard let theItem = item as? NSObject else { return } // TODO: Change the `NSObject` part -
    
    #if os(iOS) || os(tvOS)
    let detailVC = MainDetailViewController()
    // TODO: give `detail` the `item`
    let nc = UINavigationController()
    nc.viewControllers = [detailVC]
//    self.title = animItem.name
    self.showDetailViewController(nc, sender: self)
    #endif
    
    #if os(OSX)
    guard let splitVC = parent as? NSSplitViewController else { return }
    guard let detail = splitVC.children.last as? MainDetailViewController else { return }
//    detail.item = theItem
    #endif
  }
  
}
