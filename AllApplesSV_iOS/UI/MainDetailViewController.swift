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
  // MARK: Data Properties -
  
  var item = DataItem.none {
    didSet { customizeView() }
  }
  
  // MARK: -
  // MARK: UI Properties -
  
  private(set) public lazy var textLayer: CATextLayer = {
    let tl = CATextLayer()
    tl.fontSize = view.bounds.size.height * 0.6
    tl.foregroundColor = AColor.white.cgColor
    tl.backgroundColor = AColor.systemBlue.cgColor
    tl.anchorPoint = CGPoint(x: 0, y: 0)
    tl.bounds = view.bounds.insetBy(dx: 50, dy: 50)
    tl.position = CGPoint(x: 50.0, y: 50.0)
    tl.alignmentMode = .center
    #if os(iOS) || os(tvOS)
    tl.isGeometryFlipped = true
    #endif
    return tl
  }()
  
  // MARK: -
  // MARK: View Lifecycle -
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // INFO: Need to typecast our view to the appropriate `View` type, which will be resolved at compile time
    if let aView = view as? AView {
      aView.wantsLayer = true
      aView.layer?.addSublayer(textLayer)
    }
  }
  
}

// MARK: -
// MARK: Customize Item -

private extension MainDetailViewController {
  
  func customizeView() {
    title = item.name
    textLayer.string = item.name
  }
  
}
