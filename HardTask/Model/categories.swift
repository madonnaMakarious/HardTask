/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct categories : Codable {
	var ProductCategoryId = 0
    var NameAr = ""
    var NameEn = ""
    var Name = ""
    var Picture = ""
    var Subcategories : [categories] = []
    var IsLastChild : Bool = false
    var SubProductCategoriesCount = 0

	enum CodingKeys: String, CodingKey {

		case ProductCategoryId = "ProductCategoryId"
		case NameAr = "NameAr"
		case NameEn = "NameEn"
		case Name = "Name"
		case Picture = "Picture"
		case Subcategories = "Subcategories"
		case IsLastChild = "IsLastChild"
        case SubProductCategoriesCount = "SubProductCategoriesCount"
        
        
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        ProductCategoryId = try values.decodeIfPresent(Int.self, forKey: .ProductCategoryId) ?? 0
        SubProductCategoriesCount = try values.decodeIfPresent(Int.self, forKey: .SubProductCategoriesCount) ?? 0
        NameAr = try values.decodeIfPresent(String.self, forKey: .NameAr) ?? ""
        NameEn = try values.decodeIfPresent(String.self, forKey: .NameEn) ?? ""
        Name = try values.decodeIfPresent(String.self, forKey: .Name) ?? ""
        Picture = try values.decodeIfPresent(String.self, forKey: .Picture) ?? ""
        Subcategories = try values.decodeIfPresent([categories].self, forKey: .Subcategories) ?? []
        IsLastChild = try values.decodeIfPresent(Bool.self, forKey: .IsLastChild) ?? false
        
        if SharedHandler.getCurrentLanguage() == "en"{
            Name = NameEn
        }else{
            Name = NameAr
        }
	}

}
