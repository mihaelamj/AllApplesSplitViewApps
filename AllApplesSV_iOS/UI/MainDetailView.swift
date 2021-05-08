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

public class MainDetailView: AView {
  
  // MARK: -
  // MARK: UI Properties -
  
  private(set) public lazy var textLayer: CATextLayer = {
    let tl = CATextLayer()
    tl.foregroundColor = AColor.white.cgColor
    let helveticaFont = CTFontCreateWithName("Helvetica" as CFString, 60, nil)
//    tl.backgroundColor = AColor.systemBlue.cgColor
    tl.font = helveticaFont
    tl.isWrapped = true
    tl.truncationMode = .end
    tl.anchorPoint = CGPoint(x: 0, y: 0)
    tl.alignmentMode = .center
    tl.fontSize = 40

    #if os(iOS) || os(tvOS)
    tl.contentsScale = AScreen.main.scale
    #endif
    #if os(OSX)
    tl.contentsScale = AScreen.main?.scale ?? 2
    tl.isGeometryFlipped = true
    #endif
    return tl
  }()
  
  // MARK: -
  // MARK: Init -
  
  required init() {
    super.init(frame: .zero)
    setupLayer()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: -
  // MARK: Layout -

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
    #if os(OSX)
    wantsLayer = true
    layer?.addSublayer(textLayer)
    #endif
    
    #if os(iOS) || os(tvOS)
    layer.addSublayer(textLayer)
    #endif
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
//    textLayer.fontSize = bounds.size.width * 0.2
    textLayer.bounds = bounds.insetBy(dx: 50, dy: 100)
    textLayer.position = CGPoint(x: 50.0, y: 100.0)
  }
}
