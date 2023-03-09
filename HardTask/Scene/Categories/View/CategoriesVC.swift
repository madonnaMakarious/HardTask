//
//  CategoriesVC.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//

import UIKit

class CategoriesVC: BaseVC{
    
    var presenter: CategoriesPresenter?
    
    lazy var mainView: CategoryView = {
        let view = CategoryView(frame: self.view.frame)
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
        presenter?.getCategories()
        settingNavigationLogo()
        
    }
}
