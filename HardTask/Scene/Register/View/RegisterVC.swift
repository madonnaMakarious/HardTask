//
//  RegisterVC.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//

import UIKit

class RegisterVC: BaseVC {

    var presenter: RegisterPresenter?
    
    lazy var mainView: RegisterView = {
        let view = RegisterView(frame: self.view.frame)
        view.backgroundColor = .white
        view.presenter = presenter
        return view
    }()
    
    override func loadView() {
        super.loadView()
        view = mainView
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingNavFont()
        presenter?.getCountries()
        title = "Register".localize()
    }
    
    func openTermsPage(){
        self.navigationController?.pushViewController(TermsVC(), animated: true)
    }
}
