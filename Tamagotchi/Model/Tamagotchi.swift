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
    
    var content: String? {
        return TamagotchiData.tamagotchiDesciption[tamagochiType]
    }
    
    static var randomScript: String {
        let i = Int.random(in: 0..<TamagotchiData.scripts.count)
        return TamagotchiData.scripts[i]
    }
}

struct TamagotchiData {
    
    static let tamagotchiDesciption: [TamagotchiType: String] = [
        .bangsil: "저는 방실방실 다마고치입니당 키는 100km 몸무게는 150톤이에용 성격은 화끈하고 날라다닙니당~! 열심히 잘 클 자신은 있당니당 방실방실!!",
        .banjjag: "저는 반짝반짝 다마고치에요. 저는 특징을 모르겠어여 대충 키워주세요. 하이요 주인님ㅋ",
        .ttakkeum: "저는 선인장 다마고치 입니다. 키는 2cm 몸무게는 150g이에요. 성격은 소심하지만 마음은 따뜻해요. 열심히 잘 클 자신은 있답니다. 반가워요 주인님!!!",
        .none: "준비중입니다."
    ]

    static let tamagotchiList = [Tamagotchi(tamagochiType: .ttakkeum),
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
    
    static var scripts: [String] {
        return [
            "\(User.name)님 깃허브 푸시 하셨어용?",
            "배고파요 밥주세요~",
            "목말라요~",
            "\(User.name)님 오늘 과제 하셨어용?",
            "하이요 \(User.name)님",
            "어떻게 대장이름이 \(User.name) ㅋㅋ",
        ]
    }
    
}
