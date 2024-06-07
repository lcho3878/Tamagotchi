//
//  ViewController.swift
//  Tamagotchi
//
//  Created by 이찬호 on 6/7/24.
//

import UIKit
import SnapKit

class SelectViewController: BaseViewController {

    private let collectionVIew: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let n: CGFloat = 0
        layout.minimumLineSpacing = n
        layout.minimumInteritemSpacing = n
        
        let w = Int(UIScreen.main.bounds.width) / 3 - Int(n)
        layout.itemSize = CGSize(width: w, height: w + 30)
        
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
       
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
        configureHierarchy()
        configureLayout()
        configureCollectionView()
    }
    
    private func configureHierarchy() {
        view.addSubview(collectionVIew)
    }
    
    private func configureLayout() {
        collectionVIew.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func configureNavigationItem() {
        navigationItem.title = "다마고치 선택하기"
    }
    
    private func configureCollectionView() {
        collectionVIew.delegate = self
        collectionVIew.dataSource = self
        collectionVIew.register(SelectViewCell.self, forCellWithReuseIdentifier: SelectViewCell.id)
    }


}

extension SelectViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectViewCell.id, for: indexPath) as? SelectViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    
}

