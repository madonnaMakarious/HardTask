//
//  RegisterPresenter.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//

import Foundation

class RegisterPresenter{
    weak var view: RegisterVC?
    private let router: RegisterRouter
    private let interactor: RegisterInteractor
    
    init(view: RegisterVC, router: RegisterRouter, interactor: RegisterInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
        
    }
    
    func getCountries(){
        view?.ShowLoadingIndicator()
        interactor.ViewAllCountriesRequest(completionHandler: { res, error in
            if error == nil{
                self.view?.mainView.loadCountries(array: res!)
            }else{
                self.view?.showToast(message: error?.localizedDescription ?? "Time Out".localize())
            }
            
            self.view?.StopLoadingIndicator()
        })
    }
    
    func getCities(countryID: Int){
        view?.ShowLoadingIndicator()
        interactor.ViewAllCitesRequest(countryID: countryID, completionHandler: { res, error in
            if error == nil{
                self.view?.mainView.loadCities(array: res!)
            }else{
                self.view?.showToast(message: error?.localizedDescription ?? "Time Out".localize())
            }
            
            self.view?.StopLoadingIndicator()
        })
        
    }
}
