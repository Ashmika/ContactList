//
//  Address.swift
//  AlamofireObjectMapperSample
//
//  Created by Ashmika Gujarathi on 21/01/18.
//  Copyright © 2018 Javal Nanda. All rights reserved.
//

import Foundation
import ObjectMapper


class Address:Mappable
{
    var street: String?
    var suite:String?
    var city:String?
    var zipcode:String?
    var geo:Geo?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        street         <- map["street"]
        suite          <- map["suite"]
        city           <- map["city"]
        zipcode        <- map["zipcode"]
        geo            <- map["geo"]
        
    }
}
