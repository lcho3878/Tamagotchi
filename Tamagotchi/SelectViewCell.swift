//
//  SelectViewCell.swift
//  Tamagotchi
//
//  Created by 이찬호 on 6/7/24.
//

import UIKit
import SnapKit

class SelectViewCell: UICollectionViewCell {
    
    private let mainImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let nameLabel: UIPaddingLabel = {
        let lb = UIPaddingLabel()
        lb.text = "다마고치 이름"
        lb.font = .systemFont(ofSize: 13)
        lb.layer.borderWidth = 1
        lb.layer.borderColor = UIColor.black.cgColor
        lb.layer.cornerRadius = 4
        lb.textAlignment = .center
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureHierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainImageView.layoutIfNeeded()
        mainImageView.layer.cornerRadius = mainImageView.frame.width / 2
    }
    
    private func configureUI() {
        backgroundColor = .clear

    }
    
    private func configureHierarchy() {
        contentView.addSubview(mainImageView)
        contentView.addSubview(nameLabel)
    }
    
    private func configureLayout() {
        mainImageView.snp.makeConstraints {
            $0.horizontalEdges.top.equalTo(contentView.safeAreaLayoutGuide).inset(16)
            $0.height.equalTo(mainImageView.snp.width)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(mainImageView.snp.bottom).offset(8)
            $0.centerX.equalTo(contentView.safeAreaLayoutGuide)
            $0.height.equalTo(25)
        }
    }
    
    func configureData(_ data: Tamagotchi) {
        mainImageView.image = data.tamagotchiImage
        nameLabel.text = data.name
    }
    

    
}
