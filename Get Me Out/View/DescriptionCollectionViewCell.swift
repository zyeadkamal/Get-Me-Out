//
//  DescriptionCollectionViewCell.swift
//  Get Me Out
//
//  Created by Salah  on 13/03/2020.
//  Copyright © 2020 Salah . All rights reserved.
//

import UIKit

class DescriptionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagePlace: UIImageView!
    
    
    func editCellView(){
        imagePlace.layer.cornerRadius=imagePlace.frame.height/5
    }
    
}
