//
//  ExploreCollectionViewCell.swift
//  Get Me Out
//
//  Created by Salah  on 12/03/2020.
//  Copyright © 2020 Salah . All rights reserved.
//

import UIKit


class ExploreCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var imagePlace: UIImageView!
    func editCellView(){
        imagePlace.layer.cornerRadius=imagePlace.frame.height/5
    }
    
}
