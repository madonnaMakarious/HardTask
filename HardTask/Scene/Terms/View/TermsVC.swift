//
//  TermsVC.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//

import UIKit
import WebKit

class TermsVC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let webView = WKWebView(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
        webView.uiDelegate = self
        self.view.addSubview(webView)
                
                
        let url = URL(string: "https://www.termsfeed.com/blog/sample-terms-and-conditions-template/")
        let urlRequest:URLRequest = URLRequest(url: url!)
        DispatchQueue.main.async {
            webView.load(urlRequest)
        }
        
    }

}

extension TermsVC: WKUIDelegate{
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
