//
//  CityManager.swift
//  MambaTest
//
//  Created by Andrey Ildyakov on 16.07.17.
//  Copyright © 2017 Andrey Ildyakov. All rights reserved.
//

import Foundation
class CityManager {

    
    var addingCity: City? = nil
    
func getCity(completion:@escaping ([City]) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(getSeconds()), execute: {
        completion(self.mockResponse())
    })
}
    
    

// MARK: - private

//
    private func getSeconds() -> Int {
        var seconds = 2
        
        if UserDefaults.standard.bool(forKey: "firstTime") == true {
            seconds = 0
        }
        return seconds
    }
    

    
private func mockResponse() -> [City] {
    var array = [City]()
    array.append(mockCityObject(cityCount: 10000000, cityName: "Moscow"))
    array.append(mockCityObject(cityCount: 8000000, cityName: "London"))
    array.append(mockCityObject(cityCount: 18000000, cityName: "Madrid"))
    array.append(mockCityObject(cityCount: 7000000, cityName: "Dublin"))
    array.append(mockCityObject(cityCount: 22000000, cityName: "Tivat"))
    if self.addingCity != nil {
        array.append(self.addingCity!)
    }
    return array
}

private func mockCityObject(cityCount: Int, cityName: String) -> City {
    var city = City()
    
    city.cityName = cityName
    city.cityCount = cityCount

    return city
}
}
