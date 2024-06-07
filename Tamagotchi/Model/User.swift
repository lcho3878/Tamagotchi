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
    
    static var water: Int {
        get {
            return UserDefaults.standard.integer(forKey: "water")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "water")
        }
    }
    
    static var rice: Int {
        get {
            return UserDefaults.standard.integer(forKey: "rice")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "rice")
        }
    }
    
    static var level: Int {
        let n: Double = Double((rice / 5) + (water / 2))
        switch n {
        case 0..<10: return 1
        case 10...100: return Int(n / 10)
        default:
            return 10
        }
    }
    
    static var tamagotchi: Tamagotchi? {
        get {
            guard let rawValue = UserDefaults.standard.string(forKey: "tamagotchiType") else {
                return nil
            }
            let tamagotchiType = TamagotchiType(rawValue: rawValue)!
            return Tamagotchi(tamagochiType: tamagotchiType)
        }
        set {
            UserDefaults.standard.set(newValue?.tamagochiType.rawValue, forKey: "tamagotchiType")
        }
    }
}
