//
//  ViewController.swift
//  SRTextStyleDemoApp
//
//  Created by Heeseung Seo on 2016. 5. 3..
//  Copyright © 2016년 Seorenn. All rights reserved.
//

import Cocoa
import SRTextStyle

class ViewController: NSViewController {

  @IBOutlet weak var label: NSTextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    let text = SRTextStyle(defaultStyleFromTextField: self.label)
    text.addText("Default Text")
    text.addText(" with small red text", font: NSFont.systemFontOfSize(9), color: NSColor.redColor())
    
    self.label.attributedStringValue = text.attributedString
  }

  override var representedObject: AnyObject? {
    didSet {
    // Update the view, if already loaded.
    }
  }


}

