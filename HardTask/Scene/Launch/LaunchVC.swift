//
//  LaunchVC.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//

import UIKit

class LaunchVC: BaseVC{

    var presenter: LaunchPresenter!
    
    lazy var lbl_Name: UILabel = {
        var label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var stactView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.isHidden = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var btn_task1: UIButton =  {
       let button = UIButton()
        button.setTitle("Task 1".localize(), for: UIControl.State.normal)
        button.backgroundColor = .loadingColor
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(stTaskPressed), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    private lazy var btn_task2: UIButton =  {
       let button = UIButton()
        button.setTitle("Task 2".localize(), for: UIControl.State.normal)
        button.backgroundColor = .loadingColor
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(ndTaskPressed), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    private lazy var btn_Language: UIButton =  {
       let button = UIButton()
        button.isHidden = true
        if SharedHandler.getCurrentLanguage() == "en"{
            button.setTitle("اللغة العربية", for: UIControl.State.normal)
        }else{
            button.setTitle("English", for: UIControl.State.normal)
        }
        button.backgroundColor = .loadingColor
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(changeLanguage), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    override func loadView() {
        super.loadView()
        layoutUILaunch()
        view.backgroundColor = .appBackground
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LaunchPresenter(view: self)
        
    }
    
    func layoutUILaunch(){
        view.addSubview(lbl_Name)
        view.addSubview(stactView)
        
        stactView.addArrangedSubview(btn_task1)
        stactView.addArrangedSubview(btn_task2)
        
        view.addSubview(btn_Language)
        
        NSLayoutConstraint.activate([
        
            lbl_Name.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            lbl_Name.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            stactView.topAnchor.constraint(equalTo: lbl_Name.bottomAnchor, constant: 20),
            stactView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stactView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stactView.heightAnchor.constraint(equalToConstant: 50),
            
            btn_Language.topAnchor.constraint(equalTo: stactView.bottomAnchor, constant: 20),
            btn_Language.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btn_Language.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            btn_Language.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    func unhiddenStackButtons(){
        stactView.isHidden = false
        btn_Language.isHidden = false
    }
    
    @objc func stTaskPressed(){
        let nav = UINavigationController(rootViewController: CategoriesRouter.create(url: URLs.allCategories))
        nav.navigationBar.backgroundColor = .appBackground
        present(nav, animated: true)
    }
    
    @objc func ndTaskPressed(){
        let nav = UINavigationController(rootViewController: RegisterRouter.create())
        nav.navigationBar.backgroundColor = .appBackground
        present(nav, animated: true)
    }
    
    @objc func changeLanguage(){
        if SharedHandler.getCurrentLanguage() == "en"{
            
            AppLanguage.shared.set(index: .arabic)
            UserDefaults.standard.set("ar", forKey: "currentLang")
            restartApplication()
        }else{
            
            AppLanguage.shared.set(index: .english)
            UserDefaults.standard.set("en", forKey: "currentLang")
            restartApplication()
        }
        
        
    }
}


