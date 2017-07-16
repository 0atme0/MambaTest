//
//  CityTableViewModel.swift
//  MambaTest
//
//  Created by Andrey Ildyakov on 16.07.17.
//  Copyright © 2017 Andrey Ildyakov. All rights reserved.
//

import Foundation

class CityTableViewModel    {
    weak var cityManager: CityManager!
    private var cellsArray = [CityCellViewModel]()
    private var cityArray: [City]!
    var cityDetailsViewModel: CityDetailViewModel!
    var count : Int = 0
    
    func updateCity(completion:@escaping () -> Void) {
        cellsArray.removeAll()
        cityManager.getCity { (cityArray) -> Void in
            self.cityArray = cityArray
            for cityObject in cityArray {
                self.cellsArray.append(CityCellViewModel(city: cityObject))
            }
            //sorting array
            self.cellsArray = self.cellsArray.sorted {
                $0.cityCount > $1.cityCount
            }
            completion()
        }
    }
    
    func isFirstTime() -> Bool {
        var returnBool = true
        if UserDefaults.standard.bool(forKey: "firstTime") == true {
            returnBool = false
        }
        UserDefaults.standard.set(true, forKey: "firstTime")

        return returnBool
    }
    
    func numberOfCities() -> Int {
        
        return cellsArray.count
    }
    
    func cellViewModel(index: Int) -> CityCellViewModel? {
        guard index < cellsArray.count else { return nil }
        return cellsArray[index]
    }
    func deleteCell(index:Int) {
        cellsArray.remove(at: index)
    }
    func addCityDetailsViewModel(name:String, count:String, completion:@escaping (Bool)->()) {
        
  //check for valid
        
        
        if (CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: count)) && !name.isEmpty && !count.isEmpty) {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                self.cityManager.addingCity = City(cityName:name, cityCount: Int(count))
                
                completion(false)
            })
        } else {
                completion(true)
        }

   
        
    }
    
    func cityDetailsViewModel(index: Int) -> CityDetailViewModel {
        self.cityDetailsViewModel = CityDetailViewModel(city: cityArray[index])
        return self.cityDetailsViewModel
    }
    
    
    required init(cityManager: CityManager) {
        self.cityManager = cityManager
    }
}
