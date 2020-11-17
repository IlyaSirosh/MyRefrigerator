//
//  ViewController.swift
//  MyRefrigerator
//
//  Created by Illya Sirosh on 12.11.2020.
//

import UIKit


class RefrigeratorViewController: UITableViewController {

    var presenter: RefrigeratorPresenter!
    var products: [StoredProduct] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: String(describing: ProductTableViewCell.self))
        
        presenter.loadStoredProducts()
    }


}

//MARK: - RefrigeratorView
extension RefrigeratorViewController: RefrigeratorView {
    
    func show(storedProducts products: [StoredProduct]) {
        self.products = products
        tableView.reloadData()
    }
}


//MARK: - UITableViewDataSource Methods
extension RefrigeratorViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductTableViewCell.self), for: indexPath) as! ProductTableViewCell
        
        let product = products[indexPath.row]
        cell.setProduct(product)
        
        return cell
    }
}

//MARK: - UITableViewDelegate Methods
extension RefrigeratorViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80.0
    }
    
}
