//
//  SignInViewController.swift
//  Get Me Out
//
//  Created by Salah  on 27/05/2020.
//  Copyright © 2020 Salah . All rights reserved.
//

import UIKit
import Lottie

class SignInViewController: UIViewController,UITextFieldDelegate{
    let animationView = AnimationView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimation()
        emailTextField.setBottomBorder()
        passwordTextField.setBottomBorder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let navBar = navigationController?.navigationBar else { fatalError("Navigation controller does not exist.")}
        navBar.hide()

    }
    
    
    @IBOutlet weak var lottieView: UIView!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signInBtn(_ sender: UIButton) {
    }
    
    @IBAction func signInFaceBook(_ sender: UIButton) {
    }
    @IBAction func goToSignUp(_ sender: UIButton) {
    }
    @IBOutlet weak var faceBookButton: UIButton!{
        didSet{
            self.faceBookButton.rounded()
        }
    }
    
    
    func startAnimation(){
        animationView.animation = Animation.named("location")
        animationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        animationView.center = lottieView.center
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        lottieView.addSubview(animationView)
    }
    
}

