//
//  LaunchPresenter.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//

import Foundation
import UIKit

class LaunchPresenter{
    
    private var timer : Timer?
    private weak var view: LaunchVC?
    
    private var animationString = "MaDonna Galab \n Assessment".localize()
    private var index = 0
    
    init(view: LaunchVC) {
        self.view = view
        scheduledTimerWithTimeInterval()
    }
    func scheduledTimerWithTimeInterval(){
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateCounting(sender:)), userInfo: nil, repeats: true)
    }
    
    func getAnimationText() -> String{
        return animationString
    }
    
    @objc func updateCounting(sender: Timer){
        
        let letter = Array(animationString)[index]
        index += 1
        view!.lbl_Name.text = "\(view!.lbl_Name.text ?? "")\(letter)"
        if index == animationString.count{
            timer!.invalidate()
            timer = nil
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.view?.unhiddenStackButtons()
             }
        }else{}
    }
    
    
}

