//
//  CategoriesRouter.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//

import Foundation

class CategoriesRouter{
    class func create(url: String) -> CategoriesVC{

        let vc = CategoriesVC()

        let router = CategoriesRouter()
        let interactor = CategoriesInteractor()
        let presenter = CategoriesPresenter(view: vc, router: router, interactor: interactor, url: url)
        
        vc.presenter = presenter
        
        
        return vc
    }
}
