//
//  UserDafaultsService.swift
//  RegistrationsApp
//
//  Created by Martynov Evgeny on 22.11.22.
//

import Foundation

// MARK: - UserDafaultsService

final class UserDafaultsService {
    static func saveUserModel(userModel: UserModel) {
        UserDefaults.standard.set(userModel.name,
                                  forKey: UserDefaults.Keys.name.rawValue)
        UserDefaults.standard.set(userModel.email,
                                  forKey: UserDefaults.Keys.email.rawValue)
        UserDefaults.standard.set(userModel.pass,
                                  forKey: UserDefaults.Keys.password.rawValue)
    }

    static func getUserModel() -> UserModel? {
        let name = UserDefaults.standard.string(forKey: UserDefaults.Keys.name.rawValue)
        guard let email = UserDefaults.standard.string(forKey: UserDefaults.Keys.email.rawValue),
              let password = UserDefaults.standard.string(forKey: UserDefaults.Keys.password.rawValue)
        else {
            return nil
        }
        let userModel = UserModel(name: name, email: email, pass: password)
        return userModel
    }

    static func cleanUserDafauls() {
        UserDefaults.standard.reset()
    }
}
