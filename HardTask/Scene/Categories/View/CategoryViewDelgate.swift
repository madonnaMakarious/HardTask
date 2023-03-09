//
//  CategoryViewDelgate.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//

import UIKit


extension CategoryView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func loadCategories(array: [categories]){
        self.arrCategories = array
        self.CategoriesCollection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let width = (collectionView.frame.width / 2) - 5
        return CGSize(width: width , height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        print(arrCategories[indexPath.row].Name)
        cell.setSingleGymCell(singleCategory: arrCategories[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard arrCategories[indexPath.row].IsLastChild else {
            
            let vc = CategoriesRouter.create(url: "\(URLs.subCategory)\(arrCategories[indexPath.row].ProductCategoryId)")
            presenter?.view?.navigationController?.pushViewController(vc, animated: true)
            return
        }
        presenter?.view?.showToast(message: "There is no more Child".localize())
    }
    
    
}
