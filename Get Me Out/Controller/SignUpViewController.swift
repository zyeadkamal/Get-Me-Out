//
//  SignUpViewController.swift
//  Get Me Out
//
//  Created by Salah  on 27/05/2020.
//  Copyright © 2020 Salah . All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var createButton: UIButton!{
        didSet{
            self.createButton.rounded()
        }
    }
    
    
    override func viewDidLoad() {
    
    }
    
    @IBOutlet weak var nameTextField: UITextField!{
        didSet{
            self.nameTextField.setBottomBorder()
        }
    }
    
    @IBOutlet weak var phoneTextField: UITextField!{
        didSet{
            self.phoneTextField.setBottomBorder()
        }
    }
    @IBOutlet weak var emailTextField: UITextField!{
        didSet{
            self.emailTextField.setBottomBorder()
        }
    }
    @IBOutlet weak var currentLocationTextField: UITextField!{
        didSet{
            self.currentLocationTextField.setBottomBorder()
        }
    }
    @IBOutlet weak var passwordTextField: UITextField!{
        didSet{
            self.passwordTextField.setBottomBorder()
        }
    }
    @IBAction func createAcoount(_ sender: UIButton) {
    }
    
}


