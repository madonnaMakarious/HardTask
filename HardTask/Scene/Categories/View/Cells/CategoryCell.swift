//
//  CategoryCell.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    lazy var indicator: UIActivityIndicatorView = {
       let indicator = UIActivityIndicatorView()
        indicator.startAnimating()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    lazy var categoryImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var stactView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var categoryName: UILabel = {
       var label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        
        label.layer.shadowOpacity = 0.8
        label.layer.shadowRadius = 0.8
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = CGSizeMake(0.0, -0.8)
        
        return label
    }()
    
    lazy var countLbl: UILabel = {
       var label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        
        label.layer.shadowOpacity = 0.8
        label.layer.shadowRadius = 0.8
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = CGSizeMake(0.0, -0.8)
        return label
    }()
    
    func setSingleGymCell(singleCategory: categories){
        settingImage(url: singleCategory.Picture, picture: categoryImage)
        categoryName.text = singleCategory.Name
        countLbl.text = "( \(singleCategory.SubProductCategoriesCount) )"
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.addSubview(indicator)
        self.addSubview(categoryImage)
        self.addSubview(stactView)
        
        stactView.addArrangedSubview(categoryName)
        stactView.addArrangedSubview(countLbl)
        
        
        NSLayoutConstraint.activate([
            indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            categoryImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
            categoryImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3),
            categoryImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
            categoryImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3),
            
            
            stactView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            stactView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            stactView.trailingAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: self.trailingAnchor, multiplier: 0)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

