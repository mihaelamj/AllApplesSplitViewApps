//
//  ViewController.swift
//  AllApplesSV_iOS
//
//  Created by Mihaela Mihaljevic Jakic on 27.11.2020..
//

import UIKit
import AllApples

class ViewController: UIViewController {

  // INFO: This step is necessary -
  override func loadView() {
    let aView = AView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    aView.myColor = AColor.red
    self.view = aView
    debugPrint("View")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    let aView = view as! AView
    aView.myColor = AColor.yellow
  }

}
