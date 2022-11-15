//
//  CreateAccountViewController.swift
//  RegistrationsApp
//
//  Created by Martynov Evgeny on 15.11.22.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    /// email
    @IBOutlet private weak var emailTF: UITextField!
    @IBOutlet private weak var errorEmailLbl: UILabel!
    /// name
    @IBOutlet private weak var nameTF: UITextField!
    /// password
    @IBOutlet private weak var passwordTF: UITextField!
    @IBOutlet private weak var errorPassLbl: UILabel!
    /// password indicators
    
    @IBOutlet var strongPassIndicatorsViews: [UIView]!
    @IBOutlet private weak var confPassTF: UITextField!
    @IBOutlet private weak var errorConfPassLbl: UILabel!
    /// continueBtn
    @IBOutlet private weak var continueBtn: UIButton!
    /// scrollView
    @IBOutlet private weak var scrollView: UIScrollView!
    
    // MARK: - Properties
    
    private var isValidEmail = false { didSet { updateContinueBtnState() }}
    private var isConfPass = false { didSet { updateContinueBtnState() }}
    private var passwordStrength: PasswordStrength = .veryWeak { didSet { updateContinueBtnState() }}

    
    // MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        strongPassIndicatorsViews.forEach { view in
            view.alpha = 0.1
        }
    }
    

    // MARK: - IBAction-s
    
    @IBAction func emailTFAction(_ sender: UITextField) {
        if let email = sender.text,
           !email.isEmpty,
           VerificationService.isValidEmail(email: email) {
            isValidEmail = true
        } else {
            isValidEmail = false
        }
        errorEmailLbl.isHidden = isValidEmail
    }
    
    @IBAction func passTFAction(_ sender: UITextField) {
        if let passText = sender.text,
           !passText.isEmpty {
            passwordStrength = VerificationService.isValidPassword(pass: passText)
        } else {
            passwordStrength = .veryWeak
        }
        errorPassLbl.isHidden = passwordStrength != .veryWeak
        sutupStrongPassIndicatorsViews()
    }
    
    @IBAction func confPassTFAction(_ sender: UITextField) {
        if let confPassText = sender.text,
           !confPassText.isEmpty,
           let passText = passwordTF.text,
           !passText.isEmpty {
            isConfPass = VerificationService.isPassCofirm(pass1: passText,
                                                          pass2: confPassText)
        } else {
            isConfPass = false
        }
        errorConfPassLbl.isHidden = isConfPass
    }
    
    @IBAction func signInBtnAction() {
//        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func continueBtnAction() {
//        if let email = emailTF.text,
//           let pass = passwordTF.text {
//            let userModel = UserModel(name: nameTF.text, email: email, pass: pass)
//            performSegue(withIdentifier: "goToCodeVerifVC", sender: userModel)
//        }
    }
    
    // MARK: - Private Func-s
    
    private func updateContinueBtnState() {
        continueBtn.isEnabled = isValidEmail && isConfPass && passwordStrength != .veryWeak
    }
    
    private func sutupStrongPassIndicatorsViews() {
//        for (index, view) in strongPassIndicatorsViews.enumerated() {
//            if index <= (passwordStrength.rawValue - 1) {
//                view.alpha = 1
//            } else {
//                view.alpha = 0.1
//            }
//        }
        
        strongPassIndicatorsViews.enumerated().forEach { index, view in
            if index <= (passwordStrength.rawValue - 1) {
                view.alpha = 1
            } else {
                view.alpha = 0.1
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
