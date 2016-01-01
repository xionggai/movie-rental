//
//  Customer.swift
//  MovieRental
//
//  Created by xionggai on 1/1/16.
//  Copyright © 2016 xionggai. All rights reserved.
//

import Foundation

class Customer: NSObject {

    let name: String
    var rentals: [Rental] = [Rental]()
    
    init(name: String) {
        self.name = name
    }
    
    func addRental(arg: Rental) {
        rentals.append(arg)
    }
    
    override var description: String {
        
        get {
            var des: String = "Cutomer name is \(name):"
            for rental in rentals {
                des += "\n"
                des += rental.description
            }
            
            return des;
        }
    }
    
    func statement() -> String {
        
        var totalAmount: Double = 0
        var frequentRenterPoints = 0
        
        var result: String = "Rental Record for \(name) \n"
        
        for rental in rentals {
            let thisAmount: Double = rental.charge
            
            frequentRenterPoints++
            if (rental.movie.priceCode == .NewRelease && rental.daysRented > 1) {
                frequentRenterPoints++
            }
            
            result += "\t \(rental.movie.title) \t \(thisAmount) \n"
            totalAmount += thisAmount
        }
        result += "Amount owned is \(totalAmount) \n"
        result += "You earned \(frequentRenterPoints) frequent renter points"
        return result
    }
}
