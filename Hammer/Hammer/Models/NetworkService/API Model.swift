//
//  API Model.swift
//  Hammer
//
//  Created by Антон Шарин on 04.04.2023.
//

import Foundation


struct Food : Codable {
    var name : String
    var description : String
    var price : Int
    var image : String
    var category : String
    
    enum CodingKeys : String,CodingKey {
            case name = "name"
            case image = "image"
            case description = "description"
            case price
           case category = "category"
        }
    
}


struct MenuTableNetworkModel : Codable {
    var food : [Food]
}
