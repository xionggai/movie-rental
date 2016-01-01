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
    var priceCode: MovieType {
        
        get {
            return price.priceCode
        }
        
        set {
            switch (newValue) {
            case .Regular:
                price = RegularPrice()
            case .Children:
                price = ChildrenPrice()
            case .NewRelease:
                price = NewReleasePrice()
            }
        }
    }
    var price: Price!
    
    init(title: String, priceCode: MovieType) {
        self.title = title
        super.init()
        self.priceCode = priceCode
    }
    
    override var description: String {
        return "Movie<title \(title), proce code: \(priceCode)>"
    }
    
    func getCharge(DaysRented daysRented: Int) -> Double{
        return price.getCharge(daysRented)
    }
    
    func getFrequentRenterPoints(DaysRented daysRented: Int) -> Double {
        return price.getFrequentRenterPoints(daysRented)
    }
}
