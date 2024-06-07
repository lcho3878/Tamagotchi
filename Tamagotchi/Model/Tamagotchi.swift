//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by 이찬호 on 6/7/24.
//

import UIKit


struct Tamagotchi {
    let name: String
    
    init (name: String? = nil) {
        if let name {
            self.name = name
        }
        else {
            self.name = "준비중입니다."
        }
    }
    var tamagotchiImage: UIImage {
        var head: String = ""
        switch name {
        case "따끔따끔 다마고치": head = "1"
        case "방실방실 다마고치": head = "2"
        case "반짝반짝 다마고치": head = "3"
        default: break
        }
        return UIImage(named: "\(head)-\(User.level)") ?? UIImage.no
    }
    var content: String {
        return "\(name)에 대한 설명(임시)"
    }
}

let tamagotchiList = [Tamagotchi(name: "따끔따끔 다마고치"),
                      Tamagotchi(name: "방실방실 다마고치"),
                      Tamagotchi(name: "반짝반짝 다마고치"),
                      Tamagotchi(),
                      Tamagotchi(),
                      Tamagotchi(),
                      Tamagotchi(),
                      Tamagotchi(),
                      Tamagotchi(),
                      Tamagotchi(),
                      Tamagotchi(),
                      Tamagotchi(),
                      Tamagotchi(),
                      Tamagotchi(),
                      Tamagotchi(),
                      Tamagotchi(),
                      Tamagotchi(),
                      Tamagotchi(),
                      Tamagotchi(),
]
