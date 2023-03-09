//
//  CategoryView.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//

import UIKit

class CategoryView: UIView{
    
    var presenter: CategoriesPresenter?
    
    var arrCategories = [categories]()
    
    lazy var CategoriesCollection: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}
