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
  
  #if os(iOS) || os(tvOS)
  let textLayerHeightRatio: CGFloat = 0.1
  let textLayerWidthRatio: CGFloat = 0.9
  #endif

  #if os(OSX)
  let textLayerHeightRatio: CGFloat = 0.1
  let textLayerWidthRatio: CGFloat = 0.9
  #endif
  
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
  
  func positioningRect() -> CGRect {
    #if os(iOS) || os(tvOS)
    return readableContentGuide.layoutFrame
    #endif
    #if os(OSX)
    return bounds
    #endif
  }
  
  func normalizedHeight(_ height: CGFloat) -> CGFloat {
    let result = height.rounded(to: 10, roundingRule: .up)
    return result
  }
  
  func normalizedWidth(_ width: CGFloat) -> CGFloat {
    let result = width.rounded(to: 2, roundingRule: .down)
    return result
  }
  
  func layoutTextLayer() {
    let textLayerHeight = normalizedHeight(self.bounds.height * textLayerHeightRatio)
    let textLayerWidth = normalizedWidth(self.bounds.width * textLayerWidthRatio)
      
    textLayer.fontSize = textLayerHeight * 0.8
    let posRect = positioningRect()
    var rect = posRect
    
    
    rect.size.height = textLayerHeight
    rect.size.width -= textLayerWidth
    
    let rectSize = CGSize(width: textLayerWidth, height: textLayerHeight)
    let rectOrigin = CGPoint(
      x: (bounds.width - textLayerWidth) / 2.0 ,
      y: posRect.origin.y
    )
    textLayer.bounds = CGRect(origin: .zero, size: rectSize)
    textLayer.position = rectOrigin
  }
}
