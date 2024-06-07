//
//  UIViewController+Extension.swift
//  Tamagotchi
//
//  Created by 이찬호 on 6/8/24.
//

import UIKit

extension UIViewController {
    
    func showAlert(_ title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
}
