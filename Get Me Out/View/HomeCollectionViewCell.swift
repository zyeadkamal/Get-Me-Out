//
//  HomeCollectionViewCell.swift
//  Get Me Out
//
//  Created by Salah  on 24/03/2020.
//  Copyright © 2020 Salah . All rights reserved.
//

import UIKit

class HomeCollectionViewCell:UICollectionViewCell{
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var backGroundColour: UIView!
    @IBOutlet weak var name: UILabel!
    
    var category:Category!{
        didSet{
            self.didUpdate()
        }
    }
    
    func didUpdate(){
        if let category=category{
//            image.image=category.image
//            backGroundColour.backgroundColor=category.colour
//            name.text=category.title
        }
        else{
            image.image=nil
            backGroundColour.backgroundColor=nil
            name.text=nil
            
        }
        backGroundColour.layer.cornerRadius = 10.0
        backGroundColour.layer.masksToBounds = true
        image.layer.cornerRadius = 10.0
        image.layer.masksToBounds = true
    }
    
}
