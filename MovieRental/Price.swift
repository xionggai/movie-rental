//
//  File.swift
//  MovieRental
//
//  Created by xionggai on 1/1/16.
//  Copyright © 2016 xionggai. All rights reserved.
//

import Foundation

protocol Price {
    var priceCode: MovieType { get }
    
    func getCharge(daysRented: Int) -> Double
}

extension Price {
    func getFrequentRenterPoints(daysRented: Int) -> Double {
        if (priceCode == .NewRelease && daysRented > 1) {
            return 2
        }
        return 1
    }
}