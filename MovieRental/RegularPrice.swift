//
//  RegularPrice.swift
//  MovieRental
//
//  Created by xionggai on 1/1/16.
//  Copyright © 2016 xionggai. All rights reserved.
//

import Foundation

class RegularPrice: NSObject, Price {

    var priceCode: MovieType {
        get {
            return .Regular
        }
    }
    
    func getCharge(daysRented: Int) -> Double {
        var result: Double = 2
        if daysRented > 2 {
            result += Double(daysRented - 2) * 1.5
        }
        return result
    }
}
