//
//  ContentCollectionViewCell.swift
//  SnapKitExample
//
//  Created by 류창휘 on 2022/01/19.
//

import Foundation
import UIKit
import SnapKit

class ContentCollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        //레이아웃에 표시하기 위해서는 contentView 위에
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true //clipToBounds 란? subview들이 view의 bounds에 가둬질 수 있는 지를 판단하는 bool 값
        
        imageView.contentMode = .scaleToFill
        
        contentView.addSubview(imageView) //뷰에 서브뷰 추가
        //오토 레이아웃 설정
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview() //모든 edge에 딱 붙게 설정
            
        }
        
    }
}

