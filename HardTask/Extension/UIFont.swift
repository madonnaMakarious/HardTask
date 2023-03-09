//
//  UILabel.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//

import UIKit

struct AppFontName {
    static let fontEN = "Montserrat-Regular"
    static let fontAR = "GEDinarOne-Medium"
}

//customise font
extension UIFontDescriptor.AttributeName {
  static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {

  @objc class func mySystemFont(ofSize size: CGFloat) -> UIFont {
      if SharedHandler.getCurrentLanguage() == "en"{
          return UIFont(name: AppFontName.fontEN, size: size)!
      }else{
          return UIFont(name: AppFontName.fontAR, size: size)!
      }
  }

  @objc convenience init(myCoder aDecoder: NSCoder) {
    guard
        let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
        let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
        self.init(myCoder: aDecoder)
        return
    }
    var fontName = ""
    switch fontAttribute {
    case "GEDinarOne-Medium":
        fontName = AppFontName.fontAR
    case "Montserrat-Regular":
        fontName = AppFontName.fontEN
    default:
        fontName = AppFontName.fontEN
    }
    self.init(name: fontName, size: fontDescriptor.pointSize)!
  }

  class func overrideInitialize() {
    guard self == UIFont.self else { return }

    if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
        let mySystemFontMethod = class_getClassMethod(self, #selector(mySystemFont(ofSize:))) {
        method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
    }


    if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))), // Trick to get over the lack of UIFont.init(coder:))
        let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
        method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
    }
  }
}
