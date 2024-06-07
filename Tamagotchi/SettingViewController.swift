//
//  SettingViewController.swift
//  Tamagotchi
//
//  Created by 이찬호 on 6/7/24.
//

import UIKit
import SnapKit

class SettingViewController: BaseViewController {
    
    private let settingTableView: UITableView = {
        let tv = UITableView()
        tv.rowHeight = UITableView.automaticDimension
        tv.backgroundColor = .background
        tv.separatorInset = .zero
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureTableView()
    }
    
    private func configureTableView() {
//        settingTableView.
        settingTableView.delegate = self
        settingTableView.dataSource = self
    }
    
    private func configureHierarchy() {
        view.addSubview(settingTableView)
    }
    
    private func configureLayout() {
        settingTableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingMenuList.menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "settingCell")
        let data = SettingMenuList.menuList[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = data.image.withTintColor(.font, renderingMode: .alwaysOriginal)
        
        cell.textLabel?.text = data.title
        cell.textLabel?.font = .boldSystemFont(ofSize: 13)
        cell.textLabel?.textColor = .black
        
        cell.detailTextLabel?.text = data.subtitle
        cell.detailTextLabel?.font = .systemFont(ofSize: 13)
        cell.detailTextLabel?.textColor = .font
        
        cell.backgroundColor = .background
        return cell
    }
    
}
