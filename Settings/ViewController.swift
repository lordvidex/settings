//
//  ViewController.swift
//  Settings
//
//  Created by Evans Owamoyo on 02.11.2021.
//

import UIKit

class ViewController: UIViewController {
    let userDefaults = UserDefaults.standard
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        checkSettings()
    }
    
    private func checkSettings() {
        let data = userDefaults.data(forKey: AppConstants.settingsKey)
        if data == nil {
            updateSettings()
        }
        readSettings()
    }
    
    private func readSettings() {
        let data = userDefaults.data(forKey: AppConstants.settingsKey)
        
        // if data is not null, read the data
        if let data = data {
            let decoder = JSONDecoder()
            do {
                let settings = try decoder.decode(UserSettings.self, from: data)
                print(settings.authorizationMethods)
                print(settings.notificationSources)
            } catch let error {
                fatalError(error.localizedDescription)
            }
        }
        
    }
    
    private func updateSettings() {
        let userSettings = UserSettings(
            notificationSources: NotificationEnabled(phone: true,
                                                     email: false,
                                                     app: true),
            authorizationMethods: .faceId)
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(userSettings)
            userDefaults.set(data, forKey: AppConstants.settingsKey)
        } catch let error {
            fatalError(error.localizedDescription)
        }
        
    }
    
}

