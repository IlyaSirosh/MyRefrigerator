//
//  RefrigeratorView.swift
//  MyRefrigerator
//
//  Created by Illya Sirosh on 13.11.2020.
//

import Foundation

protocol RefrigeratorView: AnyObject {
    func show(storedProducts products: [StoredProduct])
}
