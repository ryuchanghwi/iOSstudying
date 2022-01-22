//
//  Content.swift
//  SnapKitPractice
//
//  Created by 류창휘 on 2022/01/19.
//

import UIKit

struct Content: Decodable {
    let sectionType: SectionTyle
    let sectionName: String
    let contentItem: [Item]
    
    enum SectionTyle: String, Decodable {
        case basic
        case main
        case large
        case rank
    }
}

struct Item: Decodable {
    let description: String
    let imageName: String
    
    var image: UIImage {
        return UIImage(named: imageName) ?? UIImage()
    }
}

