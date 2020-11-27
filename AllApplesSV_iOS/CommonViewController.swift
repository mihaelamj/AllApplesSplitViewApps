//
//  CommonViewController.swift
//  AllApplesSV_iOS
//
//  Created by Mihaela Mihaljevic Jakic on 27.11.2020..
//

import AllApples

#if os(iOS) || os(tvOS)
import UIKit
#endif

#if os(OSX)
import Cocoa
#endif

class CommonViewController: AViewController {
  
  // INFO: Need to create the appropriate `View` type for the OS -
  override func loadView() {
    let aView = AView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    
    // INFO: To work with layers on the MacOS -
    #if os(OSX)
    aView.wantsLayer = true
    #endif
    
    aView.myColor = AColor.red
    self.view = aView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // INFO: Need to typecast our view to the appropriate `View` type, which will be resolved at compile time
    if let aView = view as? AView {
      aView.myColor = AColor.yellow
    }
  }

  #if os(OSX)
  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }
  #endif
}
