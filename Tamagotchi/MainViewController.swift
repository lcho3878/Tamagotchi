//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 이찬호 on 6/7/24.
//

import UIKit

class MainViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
        configureHierarchy()
        configureLayout()
    }
    
    private func configureNavigationItem() {
        navigationItem.title = "\(User.name)님의 다마고치"
    }
    
    private func configureHierarchy() {}
    
    private func configureLayout() {}

}
