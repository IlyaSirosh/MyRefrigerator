//
//  RefrigeratorPresenter.swift
//  MyRefrigerator
//
//  Created by Illya Sirosh on 13.11.2020.
//

import Foundation

protocol RefrigeratorPresenter {
    var view: RefrigeratorView! {get set}
    
    func addProduct(_ product: StoredProduct)
    func updateProduct(_ product: StoredProduct)
    func deleteProduct(_ product: StoredProduct)
    func loadStoredProducts()
}

class RefrigeratorPresenterImpl: RefrigeratorPresenter {
    var service: RefrigeratorService!
    weak var view: RefrigeratorView!
    
    func addProduct(_ product: StoredProduct) {
        service.add(product)
        loadStoredProducts()
    }
    
    func updateProduct(_ product: StoredProduct) {
        service.update(product)
        loadStoredProducts()
    }
    
    func deleteProduct(_ product: StoredProduct) {
        service.delete(product)
        loadStoredProducts()
    }
    
    func loadStoredProducts() {
        let storedProducts = service.getStoredProducts()
        view.show(storedProducts: storedProducts)
    }

}
