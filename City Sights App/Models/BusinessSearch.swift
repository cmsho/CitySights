//
//  BusinessSearch.swift
//  City Sights App
//
//  Created by Colton Shoenberger on 9/23/21.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
    
}

struct Region: Decodable {
    var center = Coordinate()
}
