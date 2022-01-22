//
//  ContentCollectionViewHeader.swift
//  SnapKitExample
//
//  Created by 류창휘 on 2022/01/19.
//

import Foundation
import UIKit

//UICollectionReusableView이어야 헤더나 푸터 가능
class ContentCollectionViewHeader: UICollectionReusableView {
    let sectionNameLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        sectionNameLabel.font = .systemFont(ofSize: 17, weight: .bold)
        sectionNameLabel.textColor = .white
        sectionNameLabel.sizeToFit()
        
        addSubview(sectionNameLabel)
        
        sectionNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview() //센터 y를 전체 뷰와 동일하게
            $0.top.bottom.leading.equalToSuperview().offset(10) //위, 아래, 왼쪽이 10씩 떨어짐
        }
    }
}
