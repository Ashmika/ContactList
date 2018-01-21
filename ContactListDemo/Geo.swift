//
//  Geo.swift
//  AlamofireObjectMapperSample
//
//  Created by Ashmika Gujarathi on 21/01/18.
//  Copyright © 2018 Javal Nanda. All rights reserved.
//

import Foundation
import ObjectMapper


class Geo:Mappable
{
    var lat: String?
    var lng:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        lat         <- map["lat"]
        lng          <- map["lng"]
    }
}
