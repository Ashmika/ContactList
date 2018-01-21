//
//  Company.swift
//  AlamofireObjectMapperSample
//
//  Created by Ashmika Gujarathi on 21/01/18.
//  Copyright © 2018 Javal Nanda. All rights reserved.
//

import Foundation
import ObjectMapper

class Company:Mappable{
    var name:String?
    var catchPhrase:String?
    var bs:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name         <- map["name"]
        catchPhrase  <- map["catchPhrase"]
        bs  <- map["bs"]
    }
}
