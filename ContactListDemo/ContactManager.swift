//
//  ContactManager.swift
//  ContactListDemo
//
//  Created by Ashmika Gujarathi on 20/01/18.
//  Copyright © 2018 Ashmika. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper



class ContactManager: NSObject
{
   
    
    static let sharedInstance = ContactManager()
    private var manager: SessionManager
    
    private override init()
    {
        self.manager = Alamofire.SessionManager.default
    }
    
    func getCostumers(completion:@escaping (Array<Customer>) -> Void, failure:@escaping (Int, String) -> Void) -> Void
    {
        let url: String = "https://jsonplaceholder.typicode.com/users"
        
        self.manager.request(url).validate(statusCode: 200..<300).responseJSON { response in
            switch response.result {
            case .success:
                //to get JSON return value
                guard let responseJSON = response.result.value as? Array<[String: AnyObject]> else
                {
                    failure(0,"Error reading response")
                    return
                }
                
                let arrayCustomer = response.result.value
                
                print(arrayCustomer)
                
                
                let nameDiscriptor = NSSortDescriptor(key: "name", ascending: true, selector: Selector("caseInsensitiveCompare:"))
                
                let sorted = (arrayCustomer as! NSArray).sortedArray(using: [nameDiscriptor]) as! [[String : Any]]
                
                print(sorted)
                guard let customers:[Customer] = Mapper<Customer>().mapArray(JSONArray: sorted) else
                {
                    failure(0,"Error mapping response")
                    return
                }
                
                completion(customers)
            case .failure(let error):
                failure(0,"Error \(error)")
            }
        }
    }

    
    
}
