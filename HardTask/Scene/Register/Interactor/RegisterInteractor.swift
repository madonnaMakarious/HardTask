//
//  RegisterInteractor.swift
//  HardTask
//
//  Created by Donna on 08/03/2023.
//

import Alamofire

class RegisterInteractor{
    func ViewAllCountriesRequest(completionHandler: @escaping ([Countries]?, Error?) -> ()){
        Alamofire.request(URLs.countries, method: .get).validate().responseData { (response) in
            
            switch response.result {
            case .success:
                    if response.error == nil{
                        do{
                            let Response = try JSONDecoder().decode([Countries].self, from: response.data!)
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
    
    func ViewAllCitesRequest(countryID: Int,completionHandler: @escaping ([cities]?, Error?) -> ()){
        Alamofire.request("\(URLs.cities)\(countryID)", method: .get).validate().responseData { (response) in
            
            switch response.result {
            case .success:
                    if response.error == nil{
                        do{
                            let Response = try JSONDecoder().decode([cities].self, from: response.data!)
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
