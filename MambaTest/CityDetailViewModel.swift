//
//  CityDetailViewModel.swift
//  MambaTest
//
//  Created by Andrey Ildyakov on 16.07.17.
//  Copyright © 2017 Andrey Ildyakov. All rights reserved.
//

import Foundation

class CityDetailViewModel {
    
    var cityName: String!
    var cityCount: Int!

    
    required init(city: City) {
       cityCount = city.cityCount
        cityName = city.cityName
    }
    
    
    
}
