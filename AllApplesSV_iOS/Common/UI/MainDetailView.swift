//
//  MainDetailView.swift
//  AllApplesSV
//
//  Created by Mihaela Mihaljevic Jakic on 08.05.2021..
//

import Foundation
import AllApples

#if os(iOS) || os(tvOS)
import UIKit
#endif

#if os(OSX)
import Cocoa
#endif

public class MainDetailView: ALayerView {
  
  // MARK: -
  // MARK: UI Properties -
  
  private(set) public lazy var textLayer: CATextLayer = {
    let tl = CATextLayer()
    tl.foregroundColor = AColor.white.cgColor
    let helveticaFont = CTFontCreateWithName("Helvetica" as CFString, 60, nil)

    tl.font = helveticaFont
    tl.isWrapped = true
    tl.truncationMode = .end
    tl.anchorPoint = CGPoint(x: 0, y: 0)
    tl.alignmentMode = .center
    tl.fontSize = 40
    
    tl.borderColor = AColor.black.cgColor
    tl.borderWidth = 5.0
    
    #if os(OSX)
    tl.isGeometryFlipped = isFlipped
    tl.contentsScale = AScreen.main?.scale ?? 2.0
    debugPrint("tl.contentsScale = \(tl.contentsScale)")
    #endif
    
    #if os(iOS) || os(tvOS)
    tl.contentsScale = AScreen.main.scale
    debugPrint("tl.contentsScale = \(tl.contentsScale)")
    #endif
    
    return tl
  }()
  
  // MARK: -
  // MARK: Template Overrides -
  
  override public func customInit() {
    super.customInit()
    setupLayer()
  }
  
  // MARK: -
  // MARK: Layout Overrides -

  public override func layoutSubviews() {
    super.layoutSubviews()
    sizeToSuperView()
    layoutTextLayer()
  }
  
}

// MARK: -
// MARK: Private -

private extension MainDetailView {
  
  func setupLayer() {
    forcedLayer.addSublayer(textLayer)
  }
  
  func sizeToSuperView() {
    guard let aSuperview = superview else { return }
    translatesAutoresizingMaskIntoConstraints = false
    topAnchor.constraint(equalTo: aSuperview.topAnchor).isActive = true
    leadingAnchor.constraint(equalTo: aSuperview.leadingAnchor).isActive = true
    trailingAnchor.constraint(equalTo: aSuperview.trailingAnchor).isActive = true
    bottomAnchor.constraint(equalTo: aSuperview.bottomAnchor).isActive = true
  }
  
  func layoutTextLayer() {
    textLayer.fontSize = bounds.size.width * 0.2
    textLayer.bounds = bounds.insetBy(dx: 50, dy: 50)
    textLayer.position = CGPoint(x: 50.0, y: 50.0)
  }
}
