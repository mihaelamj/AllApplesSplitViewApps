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

open class MainDetailView: ALayerView {
  
  // MARK: -
  // MARK: Data Properties -
  
  let textLayerHeightRatio: CGFloat = 0.1
  let textLayerWidthRatio: CGFloat = 0.9
  
  var textLayerHeight: CGFloat = 0.0
  
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
    #endif
    
    #if os(iOS) || os(tvOS)
    tl.contentsScale = AScreen.main.scale
    #endif
    
    return tl
  }()
  
  private(set) public var contentView: ALayerView?
  
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
// MARK: Private Sizes -

private extension MainDetailView {
  
  func normalizedHeight(_ height: CGFloat) -> CGFloat {
    let result = height.rounded(to: 10, roundingRule: .up)
    return result
  }
  
  func normalizedWidth(_ width: CGFloat) -> CGFloat {
    let result = width.rounded(to: 2, roundingRule: .down)
    return result
  }
  
  func sizeToSuperView() {
    guard let aSuperview = superview else { return }
    translatesAutoresizingMaskIntoConstraints = false
    topAnchor.constraint(equalTo: aSuperview.topAnchor).isActive = true
    leadingAnchor.constraint(equalTo: aSuperview.leadingAnchor).isActive = true
    trailingAnchor.constraint(equalTo: aSuperview.trailingAnchor).isActive = true
    bottomAnchor.constraint(equalTo: aSuperview.bottomAnchor).isActive = true
  }
  
  func getTextLayerFrame(layerHeight: CGFloat) -> CGRect {
    
    let textLayerWidth = normalizedWidth(self.bounds.width * textLayerWidthRatio)
    
    var result: CGRect = .zero
    
    let posRect = readableRect()
    var rect = posRect
    
    rect.size.height = textLayerHeight
    rect.size.width -= textLayerWidth
    
    let rectSize = CGSize(width: textLayerWidth, height: textLayerHeight)
    let rectOrigin = CGPoint(
      x: (bounds.width - textLayerWidth) / 2.0 ,
      y: posRect.origin.y
    )
    
    result = CGRect(origin: rectOrigin, size: rectSize)
    
    return result
  }
  
}

// MARK: -
// MARK: Private Layout -

private extension MainDetailView {
  
  func setupLayer() {
    forcedLayer.addSublayer(textLayer)
  }
  
  func layoutTextLayer() {
    textLayerHeight = normalizedHeight(self.bounds.height * textLayerHeightRatio)
    textLayer.fontSize = textLayerHeight * 0.8
    
    let resultRect = getTextLayerFrame(layerHeight: textLayerHeight)
    
    textLayer.bounds = CGRect(origin: .zero, size: resultRect.size)
    textLayer.position = resultRect.origin
  }
  
//  func layoutTextLayer() {
//    let textLayerWidth = normalizedWidth(self.bounds.width * textLayerWidthRatio)
//    textLayerHeight = normalizedHeight(self.bounds.height * textLayerHeightRatio)
//    let textLayerWidth = normalizedWidth(self.bounds.width * textLayerWidthRatio)
//
//    textLayer.fontSize = textLayerHeight * 0.8
//    let posRect = readableRect()
//    var rect = posRect
//
//    rect.size.height = textLayerHeight
//    rect.size.width -= textLayerWidth
//
//    let rectSize = CGSize(width: textLayerWidth, height: textLayerHeight)
//    let rectOrigin = CGPoint(
//      x: (bounds.width - textLayerWidth) / 2.0 ,
//      y: posRect.origin.y
//    )
//    textLayer.bounds = CGRect(origin: .zero, size: rectSize)
//    textLayer.position = rectOrigin
//  }
  
  func layoutContentView() {
    guard let aContentView = contentView else { return }
    
  }
}
