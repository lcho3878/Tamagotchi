//
//  ViewController.swift
//  Tamagotchi
//
//  Created by 이찬호 on 6/7/24.
//

import UIKit

class SelectViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
    }
    
    private func configureNavigationItem() {
        navigationItem.title = "다마고치 선택하기"
    }


}

