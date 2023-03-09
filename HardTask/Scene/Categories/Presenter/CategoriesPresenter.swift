//
//  CategoriesPresenter.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//

import Foundation

class CategoriesPresenter{
    
    weak var view: CategoriesVC?
    private let router: CategoriesRouter
    private let interactor: CategoriesInteractor
    private let url: String
    
    
    init(view: CategoriesVC, router: CategoriesRouter, interactor: CategoriesInteractor, url: String) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.url = url
    }
    
    
    func getCategories(){
        view?.ShowLoadingIndicator()
        interactor.ViewAllPlansRequest(url: url, completionHandler: { res, error in
            if error == nil{
                self.view?.mainView.loadCategories(array: res!)
            }else{
                self.view?.showToast(message: error?.localizedDescription ?? "Time Out".localize())
            }
            
            self.view?.StopLoadingIndicator()
        })
    }
    
}
