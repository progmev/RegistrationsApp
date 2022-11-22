//
//  WelcomeVC.swift
//  RegistrationsApp
//
//  Created by Martynov Evgeny on 22.11.22.
//

import UIKit

class WelcomeVC: UIViewController {
    
    var userModel: UserModel?
    
    @IBOutlet weak var infoLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func saveUserDateAndContinueAction() {
        guard let userModel = userModel else { return }
        UserDafaultsService.saveUserModel(userModel: userModel)
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func setupUI() {
        infoLbl.text = "\(userModel?.name ?? "") to our Cool App"
    }
}
