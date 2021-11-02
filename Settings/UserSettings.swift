//
//  UserSettings.swift
//  Settings
//
//  Created by Evans Owamoyo on 02.11.2021.
//

import Foundation


struct NotificationEnabled: Codable {
    var phone = false
    var email = false
    var app = false
}

enum AuthorizationMethod: Codable {
    case faceId, automatic, control
}

struct UserSettings: Codable {
    var notificationSources: NotificationEnabled
    var authorizationMethods: AuthorizationMethod
}
