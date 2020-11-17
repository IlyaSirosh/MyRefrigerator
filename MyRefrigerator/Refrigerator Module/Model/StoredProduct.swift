//
//  ProductRecord.swift
//  MyRefrigerator
//
//  Created by Illya Sirosh on 13.11.2020.
//

import Foundation

struct StoredProduct {
    let product: Product
    let dateAdded: Date = Date()
    var status: Status = .enough
    
    
    enum Status {
        case enough, soonOutOfStock, outOfStock
    }
}
