//
//  RegisterConstraints.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//

import UIKit

extension RegisterView{
    
    func setupLayoutUI(){
        self.addSubview(scrollView)
        scrollView.addSubview(containerView)

        containerView.addSubview(stackView)
        
        stackView.addArrangedSubview(view_FullName)
        view_FullName.addSubview(tf_fullName)
        
        stackView.addArrangedSubview(view_Password)
        view_Password.addSubview(tf_Password)
        
        stackView.addArrangedSubview(stackViewForMobile)
        
        stackViewForMobile.addArrangedSubview(view_Code)
        stackViewForMobile.addArrangedSubview(view_Mobile)
        
        view_Code.addSubview(img_dropDownCode)
        view_Code.addSubview(tf_Code)
        
        view_Mobile.addSubview(tf_Mobile)
        
        
        stackView.addArrangedSubview(view_Email)
        view_Email.addSubview(tf_Email)
        
        
        stackView.addArrangedSubview(view_Country)
        view_Country.addSubview(img_dropDownCountry)
        view_Country.addSubview(tf_Country)
        
        stackView.addArrangedSubview(view_City)
        view_City.addSubview(img_dropDownCity)
        view_City.addSubview(tf_City)
        
        stackView.addArrangedSubview(stackViewForTerms)
        stackViewForTerms.addArrangedSubview(lbl_Clicking)
        stackViewForTerms.addArrangedSubview(btn_terms)
        
        stackView.addArrangedSubview(btn_Language)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
        
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1),
            
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            
            view_FullName.heightAnchor.constraint(equalToConstant: 50),
            tf_fullName.topAnchor.constraint(equalTo: view_FullName.topAnchor, constant: 7),
            tf_fullName.bottomAnchor.constraint(equalTo: view_FullName.bottomAnchor, constant: -7),
            tf_fullName.leadingAnchor.constraint(equalTo: view_FullName.leadingAnchor, constant: 7),
            tf_fullName.trailingAnchor.constraint(equalTo: view_FullName.trailingAnchor, constant: -7),
            
            
            view_Password.heightAnchor.constraint(equalToConstant: 50),
            tf_Password.topAnchor.constraint(equalTo: view_Password.topAnchor, constant: 7),
            tf_Password.bottomAnchor.constraint(equalTo: view_Password.bottomAnchor, constant: -7),
            tf_Password.leadingAnchor.constraint(equalTo: view_Password.leadingAnchor, constant: 7),
            tf_Password.trailingAnchor.constraint(equalTo: view_Password.trailingAnchor, constant: -7),
            
            
            view_Code.heightAnchor.constraint(equalToConstant: 50),
            img_dropDownCode.topAnchor.constraint(equalTo: view_Code.topAnchor, constant: 7),
            img_dropDownCode.bottomAnchor.constraint(equalTo: view_Code.bottomAnchor, constant: -7),
            img_dropDownCode.trailingAnchor.constraint(equalTo: view_Code.trailingAnchor, constant: -7),
            img_dropDownCode.widthAnchor.constraint(equalToConstant: 26),
            tf_Code.topAnchor.constraint(equalTo: view_Code.topAnchor, constant: 7),
            tf_Code.bottomAnchor.constraint(equalTo: view_Code.bottomAnchor, constant: -7),
            tf_Code.leadingAnchor.constraint(equalTo: view_Code.leadingAnchor, constant: 7),
            tf_Code.trailingAnchor.constraint(equalTo: img_dropDownCode.leadingAnchor, constant: -7),
            tf_Code.widthAnchor.constraint(equalToConstant: 90),
            
            
            view_Mobile.heightAnchor.constraint(equalToConstant: 50),
            tf_Mobile.topAnchor.constraint(equalTo: view_Mobile.topAnchor, constant: 7),
            tf_Mobile.bottomAnchor.constraint(equalTo: view_Mobile.bottomAnchor, constant: -7),
            tf_Mobile.leadingAnchor.constraint(equalTo: view_Mobile.leadingAnchor, constant: 7),
            tf_Mobile.trailingAnchor.constraint(equalTo: view_Mobile.trailingAnchor, constant: -7),
            
            
            view_Email.heightAnchor.constraint(equalToConstant: 50),
            tf_Email.topAnchor.constraint(equalTo: view_Email.topAnchor, constant: 7),
            tf_Email.bottomAnchor.constraint(equalTo: view_Email.bottomAnchor, constant: -7),
            tf_Email.leadingAnchor.constraint(equalTo: view_Email.leadingAnchor, constant: 7),
            tf_Email.trailingAnchor.constraint(equalTo: view_Email.trailingAnchor, constant: -7),
            
            
            
            view_Country.heightAnchor.constraint(equalToConstant: 50),
            img_dropDownCountry.topAnchor.constraint(equalTo: view_Country.topAnchor, constant: 7),
            img_dropDownCountry.bottomAnchor.constraint(equalTo: view_Country.bottomAnchor, constant: -7),
            img_dropDownCountry.trailingAnchor.constraint(equalTo: view_Country.trailingAnchor, constant: -7),
            img_dropDownCountry.widthAnchor.constraint(equalToConstant: 26),
            tf_Country.topAnchor.constraint(equalTo: view_Country.topAnchor, constant: 7),
            tf_Country.bottomAnchor.constraint(equalTo: view_Country.bottomAnchor, constant: -7),
            tf_Country.leadingAnchor.constraint(equalTo: view_Country.leadingAnchor, constant: 7),
            tf_Country.trailingAnchor.constraint(equalTo: img_dropDownCountry.leadingAnchor, constant: -7),
            tf_Country.widthAnchor.constraint(equalToConstant: 90),
            
            view_City.heightAnchor.constraint(equalToConstant: 50),
            img_dropDownCity.topAnchor.constraint(equalTo: view_City.topAnchor, constant: 7),
            img_dropDownCity.bottomAnchor.constraint(equalTo: view_City.bottomAnchor, constant: -7),
            img_dropDownCity.trailingAnchor.constraint(equalTo: view_City.trailingAnchor, constant: -7),
            img_dropDownCity.widthAnchor.constraint(equalToConstant: 26),
            tf_City.topAnchor.constraint(equalTo: view_City.topAnchor, constant: 7),
            tf_City.bottomAnchor.constraint(equalTo: view_City.bottomAnchor, constant: -7),
            tf_City.leadingAnchor.constraint(equalTo: view_City.leadingAnchor, constant: 7),
            tf_City.trailingAnchor.constraint(equalTo: img_dropDownCity.leadingAnchor, constant: -7),
            tf_City.widthAnchor.constraint(equalToConstant: 90),
            
            
            btn_terms.heightAnchor.constraint(equalToConstant: 60),
            btn_Language.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        SharedHandler.textFieldAligmentRTL(textFields: [tf_fullName, tf_Password, tf_Code, tf_Mobile, tf_Email, tf_Country, tf_City])
    }
}


