//
//  CategoriesInteractor.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//

import Alamofire

class CategoriesInteractor{
    
    
    func ViewAllPlansRequest(url: String,completionHandler: @escaping ([categories]?, Error?) -> ()){
        Alamofire.request(url, method: .get).validate().responseData { (response) in
            
            switch response.result {
            case .success:
                    if response.error == nil{
                        do{
                            let Response = try JSONDecoder().decode([categories].self, from: response.data!)
                            completionHandler(Response, nil)
                        }catch{
                            completionHandler(nil, response.error)
                        }
                    }else{
                        completionHandler(nil, response.error)
                    }
            case .failure :
                completionHandler(nil, response.error)
            }
        }
    }
}
