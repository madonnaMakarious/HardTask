//
//  URLs.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//

import Foundation

class URLs{
    static let base = "https://4saleq8.com/Api"
    static let allCategories = base + "/ParentCatgories"
    static let subCategory = base + "/SubCategories?categoryId="
    
    
    static let countries = base + "/Countries"
    static let cities = base + "/States?countryId="
}
