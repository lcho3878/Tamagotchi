//
//  User.swift
//  Tamagotchi
//
//  Created by 이찬호 on 6/7/24.
//

import Foundation

struct User {
    static var name: String {
        get {
            if let name = UserDefaults.standard.string(forKey: "name") {
                return name
            }
            else {
                return "대장"
            }
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "name")
        }
    }
    static var water = 0
    static var rice = 0
    static var level: Int {
        return 9
    }
}
