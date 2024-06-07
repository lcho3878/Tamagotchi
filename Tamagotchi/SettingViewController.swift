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
        configureNavigationItem()
    }
    
    private func configureNavigationItem() {
        navigationItem.title = "설정"
        navigationItem.backButtonDisplayMode = .default
    }
    
    private func configureTableView() {
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
        
        if indexPath.row == 0 {
            cell.detailTextLabel?.text = User.name
        }
        cell.detailTextLabel?.font = .systemFont(ofSize: 13)
        cell.detailTextLabel?.textColor = .font
        
        cell.backgroundColor = .background
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let nicknameVC = NicknameViewController()
            nicknameVC.delegate = self
            navigationController?.pushViewController(nicknameVC, animated: true)
        case 1:
            let selectVC = SelectViewController()
            navigationController?.pushViewController(selectVC, animated: true)
        case 2:
            let alert = UIAlertController(title: "경고", message: "정말로 데이터를 초기화 하시겠습니까?", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .destructive){ _ in
                User.removeData()
                let selectVC = SelectViewController()
                self.navigationController?.setViewControllers([selectVC], animated: false)
            }
            let cancel = UIAlertAction(title: "취소", style: .cancel)
             
            alert.addAction(ok)
            alert.addAction(cancel)
            present(alert, animated: true)
        default: break
        }
    }
}

extension SettingViewController: NicknameViewControllerDelegate {
    func updateUI() {
        settingTableView.reloadData()
    }
}
