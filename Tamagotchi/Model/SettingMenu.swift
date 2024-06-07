//
//  SettingMenu.swift
//  Tamagotchi
//
//  Created by 이찬호 on 6/7/24.
//

import UIKit

struct SettingMenu {
    
    enum MenuType {
        case changeName
        case changeTamagotchi
        case resetData
    }
    
    let image: UIImage
    let title: String
    let type: MenuType
}

struct SettingMenuList {
    static let menuList = [
        SettingMenu(image: UIImage(systemName: "pencil")!, title: "내 이름 설정하기", type: .changeName),
        SettingMenu(image: UIImage(systemName: "moon.fill")!, title: "다마고치 변경하기", type: .changeTamagotchi),
        SettingMenu(image: UIImage(systemName: "arrow.clockwise")!, title: "데이터 초기화", type: .resetData)
    ]
}
