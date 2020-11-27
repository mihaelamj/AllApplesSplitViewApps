//
//  ViewController.swift
//  AllApplesSV_Mac
//
//  Created by Mihaela Mihaljevic Jakic on 27.11.2020..
//

import Cocoa
import AllApples

class ViewController: NSViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let aView = view as! AView
    aView.myColor = AColor.yellow
    // Do any additional setup after loading the view.
  }
  
  override func loadView() {
    let aView = AView(frame: NSRect(x: 0, y: 0, width: 300, height: 300))
    aView.wantsLayer = true
    aView.myColor = AColor.red
    self.view = aView
    debugPrint("View")
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }

}

