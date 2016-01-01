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
    
    private var totalCharge: Double {
        get {
            var result: Double = 0
            for rental in rentals {
                result += rental.charge
            }
            return result
        }
    }
    
    private var totalFrequentRenterPoints: Double {
        get {
            var result: Double = 0
            for rental in rentals {
                result += rental.frequentRenterPoints
            }
            return result
        }
    }
    
    func statement() -> String {
        var result: String = "Rental Record for \(name) \n"
        
        for rental in rentals {
            
            result += "\t \(rental.movie.title) \t \(rental.charge) \n"
        }
        
        result += "Amount owned is \(totalCharge) \n"
        result += "You earned \(totalFrequentRenterPoints) frequent renter points"
        
        return result
    }
}
