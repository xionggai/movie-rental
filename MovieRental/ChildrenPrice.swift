//
//  ChildrenPrice.swift
//  MovieRental
//
//  Created by xionggai on 1/1/16.
//  Copyright © 2016 xionggai. All rights reserved.
//

import Foundation

class ChildrenPrice:NSObject, Price {

    var priceCode: MovieType {
        get {
            return .Children
        }
    }
    
    func getCharge(daysRented: Int) -> Double {
        var result = 1.5
        if daysRented > 3 {
            result += Double(daysRented - 3) * 1.5
        }
        return result
    }
}
