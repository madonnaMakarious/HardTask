//
//  UIView.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//

import UIKit
import Kingfisher


extension UIView{
    func settingImage(url: String, picture: UIImageView) {
        DispatchQueue.main.async {
//            picture.kf.setImage(with: URL(string: url.encodeUrl())!, placeholder: UIImage(named: "cat_no_img"), options: nil, completionHandler: nil)
            picture.kf.setImage(with: URL(string: url.encodeUrl()), placeholder: UIImage(named: "cat_no_img")) { image, error, cacheType, imageURL in
                print("")
            }
        }
    }
}
