//
//  PopupViewController.swift
//  Tamagotchi
//
//  Created by 이찬호 on 6/7/24.
//

import UIKit
import SnapKit

protocol PopupViewControllerDelegate: AnyObject {
    func changeRootViewController ()
}

class PopupViewController: UIViewController {
    var tamagotchi: Tamagotchi!
    
    weak var delegate: PopupViewControllerDelegate?
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .background
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    private let mainImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.contentMode = .scaleAspectFill
        view.image = UIImage._1_3
        return view
    }()
    
    private let nameLabel: UIPaddingLabel = {
        let lb = UIPaddingLabel()
        lb.text = "다마고치 이름"
        lb.textColor = .font
        lb.font = .boldSystemFont(ofSize: 14)
        lb.textAlignment = .center
        lb.layer.borderColor = UIColor.border.cgColor
        lb.layer.borderWidth = 1
        lb.layer.cornerRadius = 4
        return lb
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .border
        return view
    }()
    
    private let contentLabel: UILabel = {
        let lb = UILabel()
        lb.text = "다마고치 내용"
        lb.font = .systemFont(ofSize: 14)
        lb.textColor = .font
        lb.textAlignment = .center
        lb.numberOfLines = 0
        return lb
    }()
    
    private let buttonLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .border
        return view
    }()
    
    private let okButton: UIButton = {
        let button = UIButton()
        button.setTitle(User.tamagotchi == nil ? "시작하기" : "변경하기", for: .normal)
        button.setTitleColor(.font, for: .normal)
        button.addTarget(self, action: #selector(okButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("취소", for: .normal)
        button.setTitleColor(.font, for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.maskedCorners = .layerMinXMaxYCorner
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(cancelButtonClicked), for: .touchUpInside)
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainImageView.layer.cornerRadius = mainImageView.frame.width / 2
    }
    
    private func configureHierarchy() {
        
        view.addSubview(mainView)
        mainView.addSubview(mainImageView)
        mainView.addSubview(nameLabel)
        mainView.addSubview(lineView)
        mainView.addSubview(contentLabel)
        
        
        mainView.addSubview(buttonLineView)
        mainView.addSubview(okButton)
        mainView.addSubview(cancelButton)
        
    }
    
    private func configureLayout() {
        
        mainView.snp.makeConstraints {
            $0.verticalEdges.equalTo(view.safeAreaLayoutGuide).inset(view.frame.height / 6)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(view.frame.width / 10)
        }
        
        mainImageView.snp.makeConstraints {
            $0.size.equalTo(mainView.snp.width).multipliedBy(0.4)
            $0.centerX.equalTo(mainView)
            $0.top.equalTo(mainView.snp.top).inset(40)
        }
        
        nameLabel.snp.makeConstraints {
            $0.centerX.equalTo(mainView)
            $0.top.equalTo(mainImageView.snp.bottom).offset(8)
            $0.height.equalTo(30)
            
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(24)
            $0.horizontalEdges.equalTo(mainView).inset(48)
            $0.height.equalTo(0.5)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(24)
            $0.width.equalTo(lineView)
            $0.centerX.equalTo(mainView)
            $0.bottom.lessThanOrEqualTo(buttonLineView.snp.top).offset(-24)
        }
        
        okButton.snp.makeConstraints {
            $0.bottom.trailing.equalTo(mainView)
            $0.width.equalTo(mainView.snp.width).multipliedBy(0.5)
            $0.height.equalTo(50)
        }
        
        cancelButton.snp.makeConstraints {
            $0.bottom.leading.equalTo(mainView)
            $0.size.equalTo(okButton)
        }
        
        buttonLineView.snp.makeConstraints {
            $0.horizontalEdges.equalTo(mainView)
            $0.height.equalTo(0.5)
            $0.bottom.equalTo(okButton.snp.top)
        }
        
    }
    
    private func configureUI() {
        view.backgroundColor = .clear
        mainImageView.image = tamagotchi.tamagotchiImage
        nameLabel.text = tamagotchi.name
        contentLabel.text = tamagotchi.content
    }

    @objc private func okButtonClicked() {
        delegate?.changeRootViewController()
        User.tamagotchi = tamagotchi
        self.dismiss(animated: false)
    }
    
    @objc private func cancelButtonClicked() {
        self.dismiss(animated: true)
    }

}
