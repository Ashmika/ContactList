//
//  Customer.swift
//  AlamofireObjectMapperSample
//
//  Created by Ashmika Gujarathi on 21/01/18.
//  Copyright © 2018 Javal Nanda. All rights reserved.
//

import Foundation
import ObjectMapper


class Customer:Mappable
{
    var id: Int?
    var name: String?
    var username:String?
    var email:String?
    var phone:String?
    var website:String?
    
    var address:Address?
    var company: Company?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id            <- map["id"]
        name          <- map["name"]
        username      <- map["username"]
        email         <- map["email"]
        phone         <- map["phone"]
        website       <- map["website"]
        company        <- map["company"]
        address        <- map["address"]
    }
}
