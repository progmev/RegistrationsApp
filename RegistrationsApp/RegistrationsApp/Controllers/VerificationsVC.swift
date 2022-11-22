//
//  VerificationsVC.swift
//  RegistrationsApp
//
//  Created by Martynov Evgeny on 22.11.22.
//

import UIKit

final class VerificationsVC: UIViewController {
    
    var userModel: UserModel?
    let randomInt = Int.random(in: 100000 ... 999999)
    var sleepTime = 3
    
    @IBOutlet private weak var infoLbl: UILabel!
    @IBOutlet private weak var codeTF: UITextField!
    @IBOutlet private weak var errorCodeLbl: UILabel!
    @IBOutlet private weak var constraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startKeyboardObserver()
    }
    
    @IBAction private func codeTFAction(_ sender: UITextField) {
        guard let text = sender.text,
        !text.isEmpty, text == randomInt.description else {
            errorCodeLbl.text = "Error code. Plese wait \(sleepTime) seconds"
            sender.isUserInteractionEnabled = false
            errorCodeLbl.isHidden = false
            let dispatchAfter = DispatchTimeInterval.seconds(sleepTime)
            let deadline = DispatchTime.now() + dispatchAfter
            DispatchQueue.main.asyncAfter(deadline: deadline) {
                sender.isUserInteractionEnabled = true
                self.errorCodeLbl.isHidden = true
                self.sleepTime *= 2
            }
            return
        }
        performSegue(withIdentifier: "goToWelcomeVC", sender: nil)
    }
    
    private func setupUI() {
        infoLbl.text = "Please enter code '\(randomInt)' from \(userModel?.email ?? "")"
    }
    
    private func startKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        constraint.constant -= keyboardSize.height / 2
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        constraint.constant += keyboardSize.height / 2
    }
    

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? WelcomeVC else { return }
        destVC.userModel = userModel
    }
}
