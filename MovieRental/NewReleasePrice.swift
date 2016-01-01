//
//  NewReleasePrice.swift
//  MovieRental
//
//  Created by xionggai on 1/1/16.
//  Copyright © 2016 xionggai. All rights reserved.
//

import Foundation

class NewReleasePrice: NSObject, Price {

     var priceCode: MovieType {
        get {
            return .NewRelease
        }
    }
    
    func getCharge(daysRented: Int) -> Double {
        return Double(daysRented) * 3.0
    }
}
