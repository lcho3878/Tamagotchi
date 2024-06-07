//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 이찬호 on 6/7/24.
//

import UIKit
import SnapKit

class MainViewController: BaseViewController {
    
    private let bubbleImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.bubble
        return view
    }()
    
    private let commentLabel: UILabel = {
        let lb = UILabel()
        lb.text = "\(User.name)님 오늘 과제 하셨어용?"
        lb.font = .boldSystemFont(ofSize: 14)
        lb.textColor = .font
        lb.textAlignment = .center
        return lb
    }()
    
    private let tamagotchiImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let tamagotchiNameLabel: UIPaddingLabel = {
        let lb = UIPaddingLabel()
        lb.text = "다마고치 이름"
        lb.textColor = .font
        lb.textAlignment = .center
        lb.font = .boldSystemFont(ofSize: 15)
        lb.backgroundColor = .background
        lb.layer.borderColor = UIColor.border.cgColor
        lb.layer.borderWidth = 1
        lb.layer.cornerRadius = 4
        return lb
    }()
    
    private let dataLabel: UILabel = {
        let lb = UILabel()
        lb.text = "LV10 • 밥알 12개 • 물방울 142개"
        lb.font = .boldSystemFont(ofSize: 13)
        lb.textAlignment = .center
        lb.textColor = .font
        return lb
        }()
    
    private let riceTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "밥주세용"
        textfield.font = .systemFont(ofSize: 13)
        textfield.textAlignment = .center
        textfield.textColor = .font
        return textfield
    }()
    
    private let riceButton: UIButton = {
        let button = UIButton()
        button.setTitle("밥먹기", for: .normal)
        button.setTitleColor(.font, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 13)
        button.titleLabel?.textAlignment = .right
        button.setImage(UIImage(systemName: "drop.circle")?.withTintColor(.border).withRenderingMode(.alwaysOriginal), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.border.cgColor
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(riceButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private let waterTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "물주세용"
        textfield.font = .systemFont(ofSize: 13)
        textfield.textAlignment = .center
        textfield.textColor = .font
        return textfield
    }()
    
    private let waterButton: UIButton = {
        let button = UIButton()
        button.setTitle("물먹기", for: .normal)
        button.setTitleColor(.font, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 13)
        button.titleLabel?.textAlignment = .right
        button.setImage(UIImage(systemName: "leaf.circle")?.withTintColor(.border).withRenderingMode(.alwaysOriginal), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.border.cgColor
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(waterButtonClicked), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationItem()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tamagotchiImageView.layer.cornerRadius = tamagotchiImageView.frame.width / 2
        riceTextField.underlined(1, .border)
        waterTextField.underlined(1, .border)
    }
    
    private func configureNavigationItem() {
        navigationItem.title = "\(User.name)님의 다마고치"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.font]
        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "person.circle")?.withTintColor(.font, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(barbuttonClicked))
        navigationItem.rightBarButtonItem = rightBarButton
        navigationItem.backButtonDisplayMode = .minimal
    }
    
    private func configureHierarchy() {
        view.addSubview(bubbleImageView)
        view.addSubview(commentLabel)
        view.addSubview(tamagotchiImageView)
        view.addSubview(tamagotchiNameLabel)
        view.addSubview(dataLabel)
        view.addSubview(riceTextField)
        view.addSubview(riceButton)
        view.addSubview(waterTextField)
        view.addSubview(waterButton)
    }
    
    private func configureLayout() {
        bubbleImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(view.frame.width / 5)
            $0.height.equalTo(180)
        }
        
        commentLabel.snp.makeConstraints {
            $0.centerX.equalTo(bubbleImageView)
            $0.centerY.equalTo(bubbleImageView).inset(-20)
        }
        
        tamagotchiImageView.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(bubbleImageView.snp.bottom).offset(4)
            $0.size.equalTo(bubbleImageView.snp.width).multipliedBy(0.8)
        }
        
        tamagotchiNameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(tamagotchiImageView.snp.bottom).offset(8)
            $0.height.equalTo(30)
        }
        
        dataLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(tamagotchiNameLabel.snp.bottom).offset(4)
            $0.height.equalTo(30)
        }
        
        riceTextField.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.width.equalTo(tamagotchiImageView).multipliedBy(0.7)
            $0.top.equalTo(dataLabel.snp.bottom).offset(16)
            $0.leading.equalTo(dataLabel).inset(-16)
        }
        
        riceButton.snp.makeConstraints {
            $0.height.equalTo(riceTextField)
            $0.centerY.equalTo(riceTextField)
            $0.leading.equalTo(riceTextField.snp.trailing).offset(12)
            $0.width.equalTo(70)
        }
        
        waterTextField.snp.makeConstraints {
            $0.size.leading.equalTo(riceTextField)
            $0.top.equalTo(riceTextField.snp.bottom).offset(16)
        }
        
        waterButton.snp.makeConstraints {
            $0.height.leading.trailing.equalTo(riceButton)
            $0.centerY.equalTo(waterTextField)
        }
    }
    
    private func configureUI() {
        tamagotchiNameLabel.text = User.tamagotchi?.name
        tamagotchiImageView.image = User.tamagotchi?.tamagotchiImage
        dataLabel.text = "LV\(User.level) • 밥알 \(User.rice)개 • 물방울 \(User.water)개"
        commentLabel.text = "\(User.name)님 오늘 과제는 하셨나요?"
    }
    
    @objc
    private func riceButtonClicked() {
        guard let input = riceTextField.text, input != "" else {
            User.rice += 1
            configureUI()
            return
        }
        
        guard let n = Int(input), n < 100, n > 0 else {
            showAlert("1~99 사이의 정수를 입력해주세요")
            return
        }
        User.rice += n
        configureUI()
    }
    
    @objc
    private func waterButtonClicked() {
        guard let input = waterTextField.text, input != "" else {
            User.water += 1
            configureUI()
            return
        }
        
        guard let n = Int(input), n < 100, n > 0 else {
            showAlert("1~99 사이의 정수를 입력해주세요")
            return
        }
        User.water += n
        configureUI()
    }
    
    @objc
    private func barbuttonClicked() {
        let settingVC = SettingViewController()
        navigationController?.pushViewController(settingVC, animated: true)
    }

}
