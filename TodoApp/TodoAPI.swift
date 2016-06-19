//
//  TodoAPI.swift
//  TodoApp
//
//  Created by Brandon Danis on 2016-06-19.
//  Copyright © 2016 RBSoftware. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class TodoAPI
{
    
    var apiURL: String!
    var username: String!
    var password: String!
    
    init(url: String)
    {
        self.apiURL = url
        self.username = nil
        self.password = nil
    }
    
    func setUsername(username: String)
    {
        self.username = username
    }
    
    func setPassword(password: String)
    {
        self.password = password
    }
    
    //////////////////////////
    //      LOGIN API       //
    //////////////////////////
    
    func attemptLogin(username: String, password: String, completion: (responce: JSON) -> Void)
    {
        let parameters = [
            "username": username,
            "password": password
        ]
        
        post("/login", params: parameters, completion: completion)
        
    }
    
    
    
    /////////////////////////////
    //      HTTP METHODS       //
    ////////////////////////////
    
    func post(endpoint: String, params: [String: AnyObject], completion: (response: JSON) -> Void)
    {
        let url = self.apiURL + endpoint
        Alamofire.request(.POST, url, parameters: params)
            .responseJSON { response in
                //print(response.request)  // original URL request
                //print(response.response) // URL response
                //print(response.data)     // server data
                //print(response.result)   // result of response serialization
                
                let res: JSON = JSON(rawValue: response.result.value!)!
                
                completion(response: res)
        }
    }
    
}



