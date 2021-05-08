//
//  AScreen+Size.swift
//  AllApplesSV
//
//  Created by Mihaela Mihaljevic Jakic on 08.05.2021..
//

import AllApples

#if os(iOS) || os(tvOS)
import UIKit
#endif

#if os(OSX)
import Cocoa
#endif

public extension AScreen {
  static func theSize() -> CGSize {
    #if os(iOS) || os(tvOS)
    return AScreen.main.bounds.size
    #endif
    
    #if os(OSX)
    return AScreen.main?.visibleFrame.size ?? CGSize(width: 300.0, height: 300.0)
    #endif
  }
}
