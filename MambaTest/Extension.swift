//
//  Extension.swift
//  MambaTest
//
//  Created by Andrey Ildyakov on 16.07.17.
//  Copyright © 2017 Andrey Ildyakov. All rights reserved.
//

import Foundation
extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        return formatter
    }()
}

extension Integer {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}
