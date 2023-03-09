//
//  RegisterRouter.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//

import Foundation

class RegisterRouter{
    class func create() -> RegisterVC{

        let vc = RegisterVC()

        let router = RegisterRouter()
        let interactor = RegisterInteractor()
        let presenter = RegisterPresenter(view: vc, router: router, interactor: interactor)
        
        vc.presenter = presenter
        
        
        return vc
    }
}
