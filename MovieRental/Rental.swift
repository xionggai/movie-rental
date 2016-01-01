//
//  Rental.swift
//  MovieRental
//
//  Created by xionggai on 1/1/16.
//  Copyright © 2016 xionggai. All rights reserved.
//

import Foundation

class Rental: NSObject {

    let movie: Movie
    let daysRented: Int
    
    init(movie: Movie, daysRented: Int) {
        self.movie = movie
        self.daysRented = daysRented
    }
    
    override var description: String {
        return "Rental<movie: \(movie.description) rent days: \(daysRented)>"
    }
    
    var charge: Double {
        get {
            var result: Double = 0
            
            switch (movie.priceCode) {
            case .Regular:
                result += 2
                if (daysRented > 2) {
                    result += (Double)(daysRented - 2) * 1.5
                }
            case .NewRelease:
                result += (Double)(daysRented) * 3.0
            case .Children :
                result += 1.5
                if (daysRented > 3) {
                    result += (Double)(daysRented - 3) * 1.5
                }
            }
            return result
        }
    }
    
    var frequentRenterPoints : Double {
        get {
            if movie.priceCode == .NewRelease && daysRented > 1 {
                return 2
            }
            return 1
        }
    }
}
