//
//  Movie.swift
//  MovieRental
//
//  Created by xionggai on 1/1/16.
//  Copyright © 2016 xionggai. All rights reserved.
//

import Foundation

enum MovieType {
    case Children
    case Regular
    case NewRelease
}

class Movie: NSObject {
    
    let title: String
    let priceCode: MovieType
    
    init(title: String, priceCode: MovieType) {
        self.title = title
        self.priceCode = priceCode
    }
    
    override var description: String {
        return "Movie<title \(title), proce code: \(priceCode)>"
    }
    
    func getCharge(DaysRented daysRented: Int) -> Double{
        var result: Double = 0
        switch(priceCode) {
        case .Children:
            result += 1.5
            if (daysRented > 3) {
                result += (Double)(daysRented - 3) * 1.5
            }
        case .Regular:
            result += 2
            if (daysRented > 2) {
                result += (Double)(daysRented - 2) * 1.5;
            }
        case .NewRelease:
            result += Double(daysRented) * 3.0
        }
        return result
    }
    
    func getFrequentRenterPoints(DaysRented daysRented: Int) -> Double {
        if (priceCode == .NewRelease && daysRented > 1) {
            return 2
        }
        return 1
    }
}
