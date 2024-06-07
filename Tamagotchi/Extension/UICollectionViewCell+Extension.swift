//
//  UICollectionViewCell+Extension.swift
//  Tamagotchi
//
//  Created by 이찬호 on 6/7/24.
//

import UIKit

extension UICollectionViewCell: ReusableProtocol {
    
    static var id: String {
        return String(describing: self)
    }
    
}


