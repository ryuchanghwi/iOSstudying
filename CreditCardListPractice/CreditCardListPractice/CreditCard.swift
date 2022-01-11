//
//  CreditCard.swift
//  CreditCardListPractice
//
//  Created by 류창휘 on 2022/01/11.
//

import Foundation


struct CreditCard: Codable {
    let id: Int
    let rank: Int
    let name: String
    let cardImgageURL: String
    let promotionDetail: promotionDetail
    let isSelected: Bool? //사용자가 카드를 선택했을 때 사용될 것
}

struct promotionDetail: Codable {
    let companyName: String
    let period: String
    let amount: Int
    let condition: String
    let benefieCondition: String
    let benefitDetail: String
    let benefitDate: String
}
