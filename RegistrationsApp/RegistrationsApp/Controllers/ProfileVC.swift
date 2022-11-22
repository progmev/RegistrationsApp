//
//  ProfileVC.swift
//  RegistrationsApp
//
//  Created by Martynov Evgeny on 22.11.22.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBAction func logOutAction(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func deleteAccountAction() {
        UserDafaultsService.cleanUserDafauls()
        navigationController?.popToRootViewController(animated: true)
    }
}
