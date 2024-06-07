//
//  NicknameViewController.swift
//  Tamagotchi
//
//  Created by 이찬호 on 6/7/24.
//

import UIKit
import SnapKit

protocol NicknameViewControllerDelegate: AnyObject {
    func updateUI()
}

class NicknameViewController: BaseViewController {
    
    weak var delegate: NicknameViewControllerDelegate?

    private let nicknameTextField: UITextField = {
        let textfield = UITextField()
        textfield.text = User.name
        textfield.placeholder = "대장님 이름을 알려주세요!"
        textfield.textColor = .font
        textfield.font = .boldSystemFont(ofSize: 13)
        return textfield
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavigationItem()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nicknameTextField.underlined(1, .border)
    }
    
    private func configureNavigationItem() {
        let rightBarButton = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(barButtonClicked))
        navigationItem.rightBarButtonItem = rightBarButton
        navigationItem.title = "대장님 이름 정하기"
    }
    
    private func configureUI() {
        view.addSubview(nicknameTextField)
        
        nicknameTextField.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(12)
        }
    }
    
    @objc
    private func barButtonClicked() {
        guard let nickname = nicknameTextField.text, nickname.count >= 2, nickname.count <= 6 else {
            showAlert("2~6 글자로 입력해주세요")
            return
        }
        User.name = nickname
        delegate?.updateUI()
        navigationController?.popViewController(animated: true)
    }

}
