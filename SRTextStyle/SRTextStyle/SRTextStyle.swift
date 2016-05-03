//
//  SRTextStyle.swift
//  SRTextStyle
//
//  Created by Heeseung Seo on 2016. 5. 2..
//  Copyright © 2016년 Seorenn. All rights reserved.
//

import Cocoa

protocol SRTextStyleItemType {
  var attributedString: NSAttributedString { get }
}

struct SRTextStyleTextItem: SRTextStyleItemType {
  let text: String
  let font: NSFont?
  let color: NSColor?
  
  init(text: String, font: NSFont?, color: NSColor?) {
    self.text = text
    self.font = font
    self.color = color
  }
  
  var attributedString: NSAttributedString {
    var dict = [String : AnyObject]()
    
    if let font = self.font {
      dict[NSFontAttributeName] = font
    }
    
    if let color = self.color {
      dict[NSForegroundColorAttributeName] = color
    }
    
    return NSAttributedString(string: self.text, attributes: dict)
  }
}

public enum SRTextStyleAlign {
  case Left, Right, Center
}

public class SRTextStyle {
  public var font: NSFont?
  public var color: NSColor?
  public var align: SRTextStyleAlign = .Left
  
  var textItems = [SRTextStyleTextItem]()
  
  public convenience init() {
    self.init(defaultStyleFromTextField: nil)
  }
  
  public init(defaultStyleFromTextField: NSTextField?) {
    guard let textField = defaultStyleFromTextField else {
      // Default style
      self.font = NSFont.systemFontOfSize(13)
      self.color = NSColor.blackColor()
      return
    }
    
    self.font = textField.font
    self.color = textField.textColor
  }
  
  public var attributedString: NSAttributedString {
    let mutableAttributedString = NSMutableAttributedString()
    
    for item in self.textItems {
      mutableAttributedString.appendAttributedString(item.attributedString)
    }

    return mutableAttributedString
  }
  
  public func addText(text: String, font: NSFont? = nil, color: NSColor? = nil) {
    let item = SRTextStyleTextItem(text: text, font: font ?? self.font, color: color ?? self.color)
    self.textItems.append(item)
  }
}
