//
//  StartViewModel.swift
//  MambaTest
//
//  Created by Andrey Ildyakov on 16.07.17.
//  Copyright © 2017 Andrey Ildyakov. All rights reserved.
//

import Foundation

class StartViewModel {

    var cityTableViewModel: CityTableViewModel!
    var cityManager = CityManager()

    
    func cityViewModel() -> CityTableViewModel {
        
        self.cityTableViewModel = CityTableViewModel(cityManager: cityManager)
       
        return self.cityTableViewModel
    }
//    
    required init(cityManager: CityManager) {
        self.cityManager = cityManager
    }
}
