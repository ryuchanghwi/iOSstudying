//
//  StarCell.swift
//  DiaryProject
//
//  Created by 류창휘 on 2021/12/29.
//

import UIKit

class StarCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.contentView.layer.cornerRadius = 3
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor.black.cgColor
    }
}
