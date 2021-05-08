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
  // MARK: Data Properties -
  
  private lazy var data: DataHandler = {
    let ds = DataHandler()
    ds.delegate = self
    return ds
  }()
  
  // MARK: -
  // MARK: UI Properties -
  
  private lazy var tableView: ATableView = {
    let tv = ATableView()
    
    tv.dataSource = data
    tv.delegate = data
    
    #if os(iOS) || os(tvOS)
    tv.rowHeight = 50.0
    tv.sectionHeaderHeight = 50.0
    #endif
    
    #if os(OSX)
    tv.rowHeight = 30.0
    #endif
    
    return tv
  }()
  
  // MARK: -
  // MARK: View Lifecycle -
  
  override public func loadView() {
    self.view = tableView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    data.registerReusableViews(with: tableView)
    tableView.reloadData()
  }
  
}

// MARK: -
// MARK: Helper -

extension MainTableViewController {
  
  func showItem(_ item: DataItem, detail: MainDetailViewController) {
    detail.item = item
  }
  
  func showFirstItem(detail: MainDetailViewController) {
    guard let firstItem = data.data.items.first else { return }
    showItem(firstItem, detail: detail)
  }

}

// MARK: -
// MARK: Item Delegate -

extension MainTableViewController: ItemDelegate {
  
  func didTapOn(dataSource: Any, item: Any) {
    guard let theItem = item as? DataItem else { return }
    
    var detailVC: MainDetailViewController?
    
    #if os(iOS) || os(tvOS)
    detailVC = MainDetailViewController()
    let nc = UINavigationController()
    nc.viewControllers = [detailVC]
    self.showDetailViewController(nc, sender: self)
    #endif
    
    #if os(OSX)
    guard let splitVC = parent as? NSSplitViewController else { return }
    detailVC = splitVC.children.last as? MainDetailViewController
    #endif
    
    guard let theDetailVC = detailVC else { fatalError("The Detail View Controller is `nil`!") }
    
    self.title = theItem.name
    theDetailVC.item = theItem
  }
  
}
