//
//  RefrigeratorService.swift
//  MyRefrigerator
//
//  Created by Illya Sirosh on 13.11.2020.
//

import Foundation


protocol RefrigeratorService {
    func add(_ product: StoredProduct)
    func update(_ product: StoredProduct)
    func delete(_ product: StoredProduct)
    
    func getStoredProducts() -> [StoredProduct]
    
    func getProducts(startWith string: String?) -> [Product]
}


class RefrigeratorServiceImpl: RefrigeratorService {
    var products: [Product]
    var storedProducts: [StoredProduct]
    
    init(){
        self.products = [
            Product(name: "Cheese", imageName: "cheese"),
            Product(name: "Eggs", imageName: "eggs"),
            Product(name: "Butter", imageName: "butter"),
            Product(name: "Bread", imageName: "bread")
        ]
        self.storedProducts = [
            StoredProduct(product: products[0], status: .enough),
            StoredProduct(product: products[3], status: .soonOutOfStock),
            StoredProduct(product: products[1], status: .outOfStock)
        ]
    }
    
    func add(_ product: StoredProduct) {
        storedProducts.append(product)
    }
    
    func update(_ storedProduct: StoredProduct) {
        guard let index = getStoredProductIndex(of: storedProduct.product) else {
            return
        }
        
        storedProducts[index] = storedProduct
    }
    
    func delete(_ storedProduct: StoredProduct) {
        guard let index = getStoredProductIndex(of: storedProduct.product) else {
            return
        }
        
        storedProducts.remove(at: index)
    }
    
    func getStoredProducts() -> [StoredProduct] {
        return storedProducts
    }
    
    func getProducts(startWith searchString: String?) -> [Product] {
        if let searchString = searchString {
            return products.filter { $0.name.starts(with: searchString) }
        }
        
        return products
    }
    
    private func getStoredProductIndex(of product: Product) -> Int? {
        return storedProducts.firstIndex(where: { $0.product.name == product.name })
    }
}
