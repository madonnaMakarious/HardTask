//
//  SharedHandler.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//

import Foundation
import UIKit

class SharedHandler{
    static func getCurrentLanguage() -> String{
        let lang = UserDefaults.standard.object(forKey: "currentLang") as? String ?? "en"
        return lang
    }
    
    static func textFieldAligmentRTL(textFields: [UITextField]){
        if SharedHandler.getCurrentLanguage() == "en"{
            for i in textFields{
                i.textAlignment = .left
                i.font = UIFont(name: AppFontName.fontEN, size: 15)
            }
        }else{
            for i in textFields{
                i.textAlignment = .right
                i.font = UIFont(name: AppFontName.fontAR, size: 15)
            }
        }
        
    }
    
}
