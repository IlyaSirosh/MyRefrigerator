//
//  ProductTableViewCell.swift
//  MyRefrigerator
//
//  Created by Illya Sirosh on 17.11.2020.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setProduct(_ storedProduct: StoredProduct) {
        if let imageName = storedProduct.product.imageName {
            imageView?.image = UIImage(named: imageName)
        }
        
        textLabel?.text = storedProduct.product.name
    }
}
