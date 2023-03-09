//
//  BaseClass.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//


import UIKit


protocol BaseProtocol: AnyObject{
    func showToast(message : String, seconds: Double)
    func ShowLoadingIndicator()
    func StopLoadingIndicator()
}

class BaseVC: UIViewController {

    lazy var activityIndicator: UIActivityIndicatorView = {
        var indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        indicator.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        indicator.color = .loadingColor
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
    }
    func layoutUI(){
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
    
    func settingNavigationLogo(){
        
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 130, height: 35))
        imageView.contentMode = .scaleAspectFit

        let image = UIImage(named: "top_bar_logo")
        imageView.image = image

        navigationItem.titleView = imageView
    }
}

extension BaseVC: BaseProtocol{
    
    
    func ShowLoadingIndicator() {
        activityIndicator.startAnimating()
    }
    
    func StopLoadingIndicator() {
        activityIndicator.stopAnimating()
    }
    func showToast(message : String, seconds: Double = 0.5){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = .darkGray
        alert.view.alpha = 0.3
        alert.view.layer.cornerRadius = 15
        self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
        
    }
    
    func restartApplication () {
        let viewController = LaunchVC()
        let navCtrl = UINavigationController(rootViewController: viewController)

        guard
            let window = UIApplication.shared.keyWindow,
            let rootViewController = window.rootViewController

        else {
            return
        }

        navCtrl.view.frame = rootViewController.view.frame
        navCtrl.view.layoutIfNeeded()

        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
            window.rootViewController = navCtrl
        })
    }
    
    func settingNavFont(){
        if SharedHandler.getCurrentLanguage() == "en"{
            self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: AppFontName.fontEN, size: 16.0)!,NSAttributedString.Key.foregroundColor: UIColor.white]
        }else{
            self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: AppFontName.fontAR, size: 16.0)!,NSAttributedString.Key.foregroundColor: UIColor.white]
            
        }
        
    }
    
}


