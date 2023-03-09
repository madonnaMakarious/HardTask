//
//  String.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//

import Foundation

public extension String {
    /// Return Localized String
    var localizedString : String {
        get {
            return self.localize()
        }
    }
}
extension String {
    func localize() -> String {
        if AppLanguage.shared.bundle != nil {
            return NSLocalizedString(self, tableName: "Localizable", bundle: AppLanguage.shared.bundle!, value: "", comment: "")
        }
        return self
    }
    
    func encodeUrl() -> String {
        return self.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
    }
    
    func isValidEmail() -> Bool {
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = self as NSString
            let results = regex.matches(in: self, range: NSRange(location: 0, length: nsString.length))
            if results.count == 0 {
                returnValue = false
            }
        } catch {
            returnValue = false
        }
        return  returnValue
    }

    func isValidMobile() -> Bool {
        let phoneRegix = "^([0-9]{8})$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegix)
        let result = phoneTest.evaluate(with: self)
        return result
    }
    
}
