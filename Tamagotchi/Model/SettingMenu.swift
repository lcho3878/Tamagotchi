//
//  SettingMenu.swift
//  Tamagotchi
//
//  Created by 이찬호 on 6/7/24.
//

import UIKit

struct SettingMenu {
    
    enum MenuType: String {
        case changeName = "내 이름 설정하기"
        case changeTamagotchi = "다마고치 변경하기"
        case resetData = "데이터 초기화"
    }
    
    let image: UIImage
    let type: MenuType
    var title: String {
        return type.rawValue
    }
}

struct SettingMenuList {
    static let menuList = [
        SettingMenu(image: UIImage(systemName: "pencil")!, type: .changeName),
        SettingMenu(image: UIImage(systemName: "moon.fill")!, type: .changeTamagotchi),
        SettingMenu(image: UIImage(systemName: "arrow.clockwise")!, type: .resetData)
    ]
}
