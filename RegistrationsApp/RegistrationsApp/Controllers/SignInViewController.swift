//
//  SignInViewController.swift
//  RegistrationsApp
//
//  Created by Martynov Evgeny on 15.11.22.
//

import UIKit

final class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var errorLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let _ = UserDafaultsService.getUserModel() {
            /// в идеале нужно в UserDafaults записывать булевое значение залогирован ли пользователь
            performSegue(withIdentifier: "goToMainTBVC", sender: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        emailTF.text = ""
        passTF.text = ""
    }
    
    @IBAction func signInAction() {
        errorLbl.isHidden = true
        guard let email = emailTF.text,
              let pass = passTF.text,
              let userModel = UserDafaultsService.getUserModel(),
              email == userModel.email,
              pass == userModel.pass
        else {
            errorLbl.isHidden = false
            return
        }
        performSegue(withIdentifier: "goToMainTBVC", sender: nil)
    }
}
