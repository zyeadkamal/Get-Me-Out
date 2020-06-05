//
//  ProfileViewController.swift
//  Get Me Out
//
//  Created by zeyad on 6/2/20.
//  Copyright © 2020 Salah . All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!{
        didSet{
            self.profileImage.circle()
        }
    }
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      


    }
    
    
}
