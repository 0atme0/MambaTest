//
//  CityCellViewModel.swift
//  MambaTest
//
//  Created by Andrey Ildyakov on 16.07.17.
//  Copyright © 2017 Andrey Ildyakov. All rights reserved.
//

import Foundation

class CityCellViewModel {
    
    var cityName: String!
    var cityCountString: String!
    var cityCount: Int!
    
    required init(city: City) {
        self.cityName = city.cityName
        self.cityCount = city.cityCount
        self.cityCountString = city.cityCount.formattedWithSeparator
        
    }
    
    
    
    
    
}
