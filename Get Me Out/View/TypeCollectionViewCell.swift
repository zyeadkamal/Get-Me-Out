//
//  CategoryCollectionViewCell.swift
//  Get Me Out
//
//  Created by Salah  on 30/03/2020.
//  Copyright © 2020 Salah . All rights reserved.
//

import UIKit
import Cosmos

class TypeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rate: CosmosView!
    
    var type:Type?{
        didSet{
            didupdate()
        }
    }
    
    
    func didupdate(){
        if let type = type{
            categoryImage.image = type.image
            name.text=type.name
            rate.rating=type.rate
        }
        contentView.backgroundColor = .white
    }
    
}
