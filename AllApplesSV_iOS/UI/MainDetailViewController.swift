//
//  MainDetailViewController.swift
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

class MainDetailViewController: AViewController {
  
  // MARK: -
  // MARK: Properties -
  
  private(set) public lazy var mainView: MainDetailView = {
    let v = MainDetailView()
    #if os(iOS) || os(tvOS)
    v.layer.name = "MainDetailView Layer"
    #endif

    #if os(OSX)
    v.layer?.name = "MainDetailView Layer"
    #endif
    return v
  }()
  
  // MARK: -
  // MARK: Data Properties -
  
  var item = DataItem.none {
    didSet {
      debugPrint("Changed item: \(item)")
    }
  }
  
  
  // MARK: -
  // MARK: View Lifecycle -
  
  override func loadView() {
    view = mainView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // INFO: Need to typecast our view to the appropriate `View` type, which will be resolved at compile time
    if let aView = view as? MainDetailView {
      customizeView(aView)
    }
  }
  
}

// MARK: -
// MARK: Customize Item -

private extension MainDetailViewController {
  
  func customizeView(_ detailView: MainDetailView) {
    title = item.name
//    detailView.textLayer.string = "\(item)"
    detailView.textLayer.string = "item"
  }
  
}
