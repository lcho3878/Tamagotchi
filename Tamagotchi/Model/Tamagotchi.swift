//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by 이찬호 on 6/7/24.
//

import UIKit

enum TamagotchiType: String {
    case none = "준비중입니다."
    case ttakkeum = "따끔따끔 다마고치"
    case bangsil = "방실방실 다마고치"
    case banjjag = "반짝반짝 다마고치"
}

struct Tamagotchi {
    let tamagochiType: TamagotchiType
    
    var name: String {
        return tamagochiType.rawValue
    }
    
    var tamagotchiImage: UIImage {
        var head: String = ""
        
        switch tamagochiType {
        case .ttakkeum: head = "1"
        case .bangsil: head = "2"
        case .banjjag: head = "3"
        default: break
        }
        
        return UIImage(named: "\(head)-\(User.level < 10 ? User.level : 9)") ?? UIImage.no
    }
    var content: String {
        return "\(name)에 대한 설명(임시)"
    }
}

let tamagotchiList = [Tamagotchi(tamagochiType: .ttakkeum),
                      Tamagotchi(tamagochiType: .bangsil),
                      Tamagotchi(tamagochiType: .banjjag),
                      Tamagotchi(tamagochiType: .none),
                      Tamagotchi(tamagochiType: .none),
                      Tamagotchi(tamagochiType: .none),
                      Tamagotchi(tamagochiType: .none),
                      Tamagotchi(tamagochiType: .none),
                      Tamagotchi(tamagochiType: .none),
                      Tamagotchi(tamagochiType: .none),
                      Tamagotchi(tamagochiType: .none),
                      Tamagotchi(tamagochiType: .none),
                      Tamagotchi(tamagochiType: .none),
                      Tamagotchi(tamagochiType: .none),
                      Tamagotchi(tamagochiType: .none),
                      Tamagotchi(tamagochiType: .none),
                      Tamagotchi(tamagochiType: .none),
                      Tamagotchi(tamagochiType: .none),
                      Tamagotchi(tamagochiType: .none),
                      Tamagotchi(tamagochiType: .none),
                      Tamagotchi(tamagochiType: .none),
                      
                      
]
