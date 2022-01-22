//
//  HomeViewController.swift
//  SnapKitPractice
//
//  Created by 류창휘 on 2022/01/19.
//

import Foundation
import UIKit

class HomeViewController: UICollectionViewController {
    var contents: [Content] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //네비게이션 설정
        navigationController?.navigationBar.backgroundColor = .clear //배경색 클리어
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //빈 이미지를 네비바에 넣어줌
        navigationController?.navigationBar.shadowImage = UIImage() //그림자를 줌(경계확인 가능)
        navigationController?.hidesBarsOnSwipe = true //스크롤로 스와이프를 했을 때 네비게이션바를 가리는 효과
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "netflix_icon"), style: .plain, target: nil, action: nil) //바 버튼에 이미지를 넣어줌
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: nil, action: nil)
        
        
        //데이터 설정, 가져오기
        contents = getContents()
    }
    
    //Content.plist 를 가져오기 위한 함수
    func getContents() -> [Content] {
        guard let path = Bundle.main.path(forResource: "Content", ofType: "plist"),
              let data = FileManager.default.contents(atPath: path), //데이터는?
              let list = try? PropertyListDecoder().decode([Content].self, from: data) else { return [] } //리스트는?
        return list

    }
    
}


//UICollectionView DataSource, Delegate
extension HomeViewController {
    //섹션당 보여질 셀의 개수
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return contents[section].contentItem.count
        }
    }
    
    //컬렉션뷰 셀 설정
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    //섹션 개수 설정
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return contents.count
    }
    
    
    //셀 선택
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionName = contents[indexPath.section].sectionName
        print("TEST \(sectionName)섹션의 \(indexPath.row + 1)번째 콘텐츠")
    }
}
