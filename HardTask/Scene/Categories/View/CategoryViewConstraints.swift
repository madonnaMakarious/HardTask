//
//  CategoryViewConstraints.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//

import UIKit

extension CategoryView{
    
    
    func setup(){
        self.addSubview(CategoriesCollection)
        setupCollectionConstraints()
        
    }

    func setupCollectionConstraints(){
        
        NSLayoutConstraint.activate([
        
            CategoriesCollection.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            CategoriesCollection.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            CategoriesCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            CategoriesCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            
        ])
    }
}

