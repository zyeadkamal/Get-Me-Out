//
//  SettingsTableViewCell.swift
//  Get Me Out
//
//  Created by Salah  on 28/05/2020.
//  Copyright © 2020 Salah . All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var informationImage: UIImageView!
    
    
    var settings:Settings?{
         didSet{
             didUpdate()
         }
     }
     
     func didUpdate(){
         
        settingLabel.text = settings?.label
        informationImage.image = settings?.image
        
        settingLabel.textColor = UIColor.white
         
     }
    
    
}
